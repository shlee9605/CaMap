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

// import 'custom_class/test_data.dart';    //for test

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables(); //for dotenv
  MobileAds.instance.initialize(); //for adroid ads

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
      home: const MyMap(), //go to myMap
    );
  }
}

class MyMap extends StatelessWidget {
  //when IOS version releases, need to separate from here
  const MyMap({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyMapState(
      title: "CaMaP",
    );
  }
}

class MyMapState extends StatefulWidget {
  //create stateful widget
  const MyMapState({super.key, required this.title});

  final String title;

  @override
  State<MyMapState> createState() => _MyMapState();
}

class _MyMapState extends State<MyMapState> {
  ///////////Main Body Map Controller///////////

  Completer<NaverMapController> _controller = Completer(); //completer for async
  final MapType _mapType = MapType.Basic; //final stands for unchangable value

  void onMapCreated(NaverMapController controller) {
    //create naver map controller ->
    //ontap, double tap, etc... from naver plugin
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  List<CustomMarker> markers = []; //for marker List

  // List<CustomMarker> myMarkers = [   //for test
  //   ...TestData.markers(),
  // ...SmokingAreaData.markers()
  // ];

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
      // adUnitId: 'ca-app-pub-6031365222069976/3224225914',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', //test ad
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
        onAdClosed: (Ad ad) => print('$BannerAd onAdOpened.'),
      ),
      request: const AdRequest(),
    );

    return newbanner.load();
  }

  ///////////Main Advertisement Controller///////////

  ///////////Main Widget///////////

  @override //when overlay image,
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      //input marker in initstate
      markers.addAll(await SmokingAreaData.markers());
      markers.addAll(await TrashCanData.markers());

      //set marker images
      setState(() {
        for (CustomMarker marker in markers) {
          marker.createImage(context);
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

    //try catch banner null
    if (banner == null) {
      return Scaffold(
        body: Container(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true, //center title true
      ),
      //body for naver map
      body: Center(
        child: NaverMap(
          initialCameraPosition: const CameraPosition(
            //starting camera position
            target: LatLng(37.496406, 127.028363),
            // zoom: 17,
            zoom: 11,
          ),
          onMapCreated: onMapCreated, //call naver map controller
          locationButtonEnable: true, //current location button
          indoorEnable: true, //indoor API
          mapType: _mapType, //maptype is default(basic)
          markers: markers, //call markers I made
        ),
      ),
      //bottom bar for ads
      bottomNavigationBar: Container(
        color: Colors.green,
        width: banner!.size.width.toDouble(), //for banner size
        height: banner!.size.height.toDouble(),
        child: AdWidget(ad: banner!), //call ad banner
      ),
    );
  }

  @override
  void dispose() {
    //dispose banner
    super.dispose();
    banner?.dispose();
  }
}
