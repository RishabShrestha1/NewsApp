// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDTeVjkbBhzj0qRmCkop8sajMXfUXawA40',
    appId: '1:1002221987599:web:13e25504c000887c11807a',
    messagingSenderId: '1002221987599',
    projectId: 'newsapp-f7de0',
    authDomain: 'newsapp-f7de0.firebaseapp.com',
    storageBucket: 'newsapp-f7de0.appspot.com',
    measurementId: 'G-BWBS4S60V6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZxiaZbrqtCPSeA9SqNs38F-Jw-zaMMHE',
    appId: '1:1002221987599:android:08c4f4a82f7b616a11807a',
    messagingSenderId: '1002221987599',
    projectId: 'newsapp-f7de0',
    storageBucket: 'newsapp-f7de0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmRwMZ0bitaVgV9vPl4BFi9wP64079lVs',
    appId: '1:1002221987599:ios:1e7108ca03b5443011807a',
    messagingSenderId: '1002221987599',
    projectId: 'newsapp-f7de0',
    storageBucket: 'newsapp-f7de0.appspot.com',
    iosBundleId: 'com.example.newsappSelf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmRwMZ0bitaVgV9vPl4BFi9wP64079lVs',
    appId: '1:1002221987599:ios:1e7108ca03b5443011807a',
    messagingSenderId: '1002221987599',
    projectId: 'newsapp-f7de0',
    storageBucket: 'newsapp-f7de0.appspot.com',
    iosBundleId: 'com.example.newsappSelf',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTeVjkbBhzj0qRmCkop8sajMXfUXawA40',
    appId: '1:1002221987599:web:e8c477486af0020e11807a',
    messagingSenderId: '1002221987599',
    projectId: 'newsapp-f7de0',
    authDomain: 'newsapp-f7de0.firebaseapp.com',
    storageBucket: 'newsapp-f7de0.appspot.com',
    measurementId: 'G-K69XT60B73',
  );

}