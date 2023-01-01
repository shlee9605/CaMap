// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

//flutter run --release --no-sound-null-safety
//flutter run --debug --no-sound-null-safety
//flutter build appbundle --no-sound-null-safety

import 'dart:async';

import 'package:flutter/material.dart';

//plugins
import 'package:naver_map_plugin/naver_map_plugin.dart'; //naver map plugin
import 'package:flutter_config/flutter_config.dart'; //for dotenv
import 'package:google_mobile_ads/google_mobile_ads.dart'; //for google ad

//inner files
import 'package:camap/custom_class/custom_location.dart';
import 'package:camap/custom_class/smokingarea_location.dart';
import 'package:camap/custom_class/trashcan_location.dart';
import 'package:camap/custom_class/smokecan_location.dart';

//widget Components
import 'package:camap/components/area_info_widget.dart';

//firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:ui'; //platform dispatcher

//view
import 'package:camap/view/home.dart';
import 'package:camap/view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase core
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //firebase crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // FirebaseCrashlytics.instance.crash(); //test crashlytics

  await FlutterConfig.loadEnvVariables(); //for dotenv
  MobileAds.instance.initialize(); //for android ads

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //firebase analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug banner false
      title: 'CaMaP', // app name
      theme: ThemeData(
        //my app theme
        primarySwatch: Colors.orange,
      ),
      navigatorObservers: <NavigatorObserver>[observer], //firebase observer
      initialRoute: '/', //start from map
      routes: {
        // go to map
        '/': (context) => MyMap(
              analytics: analytics,
              observer: observer,
            ),
        // go to home
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginPage(observer: observer),
      },
    );
  }
}

class MyMap extends StatelessWidget {
  //when IOS version releases, need to separate from here
  const MyMap({super.key, required this.analytics, required this.observer});

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {
    return MyMapState(
      title: "CaMaP",
      analytics: analytics,
      observer: observer,
    );
  }
}

class MyMapState extends StatefulWidget {
  //create stateful widget
  const MyMapState(
      {super.key,
      required this.title,
      required this.analytics,
      required this.observer});

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  final String title;

  @override
  State<MyMapState> createState() => _MyMapState();
}

class _MyMapState extends State<MyMapState> {
  ///////////firebase analytics logger///////////

  Future<void> firebaseAnalyticsEvent(s) async {
    await widget.analytics.logEvent(
      name: 'marker_click_event',
      parameters: <String, dynamic>{
        'string': s,
        'int': 100,
      },
    );
  }
  ///////////firebase analytics logger///////////

  ///////////Main Body Map Controller///////////

  final MapType _mapType = MapType.Basic; //final stands for unchangable value

  NaverMapController? _controller;

  void onMapCreated(NaverMapController controller) {
    _controller = controller;
  }

  List<CustomMarker> markers = []; //for marker List

  ///////////Main Body Map Controller///////////

  ///////////Main Advertisement Controller///////////

  BannerAd? banner; //for banner
  bool loadingBanner = false; //checking banner state

  Future<void> _createBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size = //to get size of banner
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );
    if (size == null) {
      return;
    }

    final BannerAd newbanner = BannerAd(
      size: size,
      adUnitId: 'ca-app-pub-6031365222069976/3224225914',
      // adUnitId: 'ca-app-pub-3940256099942544/6300978111', //test ad
      listener: BannerAdListener(
        //for ad state, print in debug console
        // onAdClicked: ,
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            banner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: ((Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        }),
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
      request: const AdRequest(),
    );

    return newbanner.load();
  }

  ///////////Main Advertisement Controller///////////

  ///////////Main Widget///////////
  CustomMarker? tappedmarker;

  @override //when overlay image,
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      //input marker in initstate
      markers.addAll(await SmokingAreaData.markers());
      markers.addAll(await TrashCanData.markers());
      markers.addAll(await SmokeCanData.markers());

      //set marker images & on tab action
      setState(() {
        for (CustomMarker marker in markers) {
          marker.createImage(context);
          marker
              .setOnMarkerTab((Marker marker, Map<String, int> iconSize) async {
            //find tabbed marker
            tappedmarker =
                markers.firstWhere((e) => e.markerId == marker.markerId);
            //firebase click event
            firebaseAnalyticsEvent(tappedmarker!.area.name);
            //for state config
            setState(() {});
            //camera movement on marker
            await _controller
                ?.moveCamera(CameraUpdate.scrollTo(marker.position));
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //check ad banner
    if (!loadingBanner) {
      loadingBanner = true;
      _createBanner(context);
    }

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // leading sidebar button
          leading: IconButton(
            icon: const Icon(Icons.view_sidebar),
            tooltip: 'Leading',
            onPressed: () => {},
          ),
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true, //center title true
          //routing pages
          actions: <Widget>[
            IconButton(
              //route home
              icon: const Icon(Icons.home),
              tooltip: 'Home',
              onPressed: () => {Navigator.of(context).pushNamed('/home')},
            ),
            IconButton(
              icon: const Icon(Icons.login),
              tooltip: 'Login',
              onPressed: () => {Navigator.of(context).pushNamed('/login')},
            ),
          ],
        ),
        //body for naver map
        body: Stack(
          children: <Widget>[
            NaverMap(
              initialCameraPosition: const CameraPosition(
                //starting camera position
                target: LatLng(37.496406, 127.028363),
                // zoom: 17,
                zoom: 11,
              ),
              onMapTap: (latLng) {
                setState(() {
                  tappedmarker = null;
                });
              },
              onMapCreated: onMapCreated, //call naver map controller
              locationButtonEnable: true, //current location button
              indoorEnable: true, //indoor API
              mapType: _mapType, //maptype is default(basic)
              markers: markers, //call markers I made
            ),
            tappedmarker != null
                ? AreaInfoWidget(area: tappedmarker!.area)
                : Container(),
          ],
        ),
        //bottom bar for ads
        bottomNavigationBar: banner != null //if banner can't be loaded
            ? Container(
                color: Colors.green,
                width: banner!.size.width.toDouble(), //for banner size
                height: banner!.size.height.toDouble(),
                child: AdWidget(ad: banner!) //call ad banner
                )
            : Container(
                color: Colors.green,
                child: const Text('No Banner Loaded!!!'),
              ));
  }

  @override
  void dispose() {
    //dispose banner
    super.dispose();
    banner?.dispose();
  }
}
