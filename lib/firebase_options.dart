// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnW7guIaAv2INHA5rB3u420jJjsJe-plg',
    appId: '1:58420873855:web:151de0f7895e0c76928d4a',
    messagingSenderId: '58420873855',
    projectId: 'camap-317b8',
    authDomain: 'camap-317b8.firebaseapp.com',
    storageBucket: 'camap-317b8.appspot.com',
    measurementId: 'G-1ZWED6JSB7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrNljufHTPN3jBKfZTlUmQmUuCA0SO5LU',
    appId: '1:58420873855:android:1847ed301f7fbb64928d4a',
    messagingSenderId: '58420873855',
    projectId: 'camap-317b8',
    storageBucket: 'camap-317b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcDop4UMznTWrzlIHYBgdX6VSl_KgAjLg',
    appId: '1:58420873855:ios:a6a8e39450339f7d928d4a',
    messagingSenderId: '58420873855',
    projectId: 'camap-317b8',
    storageBucket: 'camap-317b8.appspot.com',
    iosClientId:
        '58420873855-amc1r7qtiimo90rqgk2vm5f50dbbum84.apps.googleusercontent.com',
    iosBundleId: 'com.example.camap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcDop4UMznTWrzlIHYBgdX6VSl_KgAjLg',
    appId: '1:58420873855:ios:a6a8e39450339f7d928d4a',
    messagingSenderId: '58420873855',
    projectId: 'camap-317b8',
    storageBucket: 'camap-317b8.appspot.com',
    iosClientId:
        '58420873855-amc1r7qtiimo90rqgk2vm5f50dbbum84.apps.googleusercontent.com',
    iosBundleId: 'com.example.camap',
  );
}
