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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCAU91Au-lTgTpB1lTxrh7dJ7SY3BlEAbM',
    appId: '1:1002948662379:web:314477589dc0c65e2d4d2e',
    messagingSenderId: '1002948662379',
    projectId: 'login-88211',
    authDomain: 'login-88211.firebaseapp.com',
    databaseURL: 'https://login-88211-default-rtdb.firebaseio.com',
    storageBucket: 'login-88211.appspot.com',
    measurementId: 'G-FGSCLH2KFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBesXABzgwwUIlyAK6tkpPY3PRzzb5nYSs',
    appId: '1:1002948662379:android:c3f5071491930b6a2d4d2e',
    messagingSenderId: '1002948662379',
    projectId: 'login-88211',
    databaseURL: 'https://login-88211-default-rtdb.firebaseio.com',
    storageBucket: 'login-88211.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYMAvS9n0S9WQool_rAKQ94XCIDymEFDQ',
    appId: '1:1002948662379:ios:441682b4c6564c7a2d4d2e',
    messagingSenderId: '1002948662379',
    projectId: 'login-88211',
    databaseURL: 'https://login-88211-default-rtdb.firebaseio.com',
    storageBucket: 'login-88211.appspot.com',
    iosBundleId: 'com.example.beybicoAdmin',
  );
}
