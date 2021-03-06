// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBMiWB01Pt8Ha811QZpyiK0bbE75fmNfF0',
    appId: '1:974103854997:web:8909dd17764f1646bf409c',
    messagingSenderId: '974103854997',
    projectId: 'ehsan-5b19e',
    authDomain: 'ehsan-5b19e.firebaseapp.com',
    storageBucket: 'ehsan-5b19e.appspot.com',
    measurementId: 'G-80LTMB3FS4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdUWBetf7bxGI0xpK0ssP2Uj3i8Z5X1Po',
    appId: '1:974103854997:android:9b4937c75233667bbf409c',
    messagingSenderId: '974103854997',
    projectId: 'ehsan-5b19e',
    storageBucket: 'ehsan-5b19e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh7yHCDIFHDUkXeVoax1jm8k5Y2DT0vEQ',
    appId: '1:974103854997:ios:6b2d5e8f4875b8acbf409c',
    messagingSenderId: '974103854997',
    projectId: 'ehsan-5b19e',
    storageBucket: 'ehsan-5b19e.appspot.com',
    iosClientId: '974103854997-rp4hmvic744kb5to7q2k0gg8p4r7bg8o.apps.googleusercontent.com',
    iosBundleId: 'com.hady.dev.ehsanProject',
  );
}
