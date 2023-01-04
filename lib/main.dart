// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

//flutter run --release --no-sound-null-safety
//flutter run --debug --no-sound-null-safety
//flutter build appbundle --no-sound-null-safety

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
//plugins
import 'package:flutter_config/flutter_config.dart'; //for dotenv
import 'package:google_mobile_ads/google_mobile_ads.dart'; //for google ad

//firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:ui'; //platform dispatcher

//view
import 'package:camap/view/home.dart';
import 'package:camap/view/login.dart';

//platform
import 'package:camap/platform/android_main.dart';
import 'package:camap/platform/web_main.dart';

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
  if (!kIsWeb) {
    await FlutterConfig.loadEnvVariables(); //for dotenv
    MobileAds.instance.initialize(); //for android ads
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //firebase analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({super.key});

  ///////////firebase messaging///////////
  _initFirebaseMessaging(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print(event.notification!.title);
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Alert"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  _getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    print("messaging.getToken() , ${await messaging.getToken()}");
  }

  ///////////firebase messaging///////////

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
        '/': (context) => Builder(builder: (context) {
              _initFirebaseMessaging(context);
              _getToken();
              return MyMap(analytics: analytics, observer: observer);
            }),
        // go to home
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginPage(observer: observer),
      },
    );
  }
}

class MyMap extends StatelessWidget {
  const MyMap({super.key, required this.analytics, required this.observer});

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const MyHomePage(title: 'Flutter Demo');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidMapState(
          title: "CaMaP",
          analytics: analytics,
          observer: observer,
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
