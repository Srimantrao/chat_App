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
    apiKey: 'AIzaSyC1qrvQaiwOzStPpc-SKuX6wlroCXXZ0ZE',
    appId: '1:341930189895:web:2cabf4d569220669c2fd62',
    messagingSenderId: '341930189895',
    projectId: 'chat-e4883',
    authDomain: 'chat-e4883.firebaseapp.com',
    storageBucket: 'chat-e4883.appspot.com',
    measurementId: 'G-L7J9LGNFX2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgZLldDUwRqBya2--vQz4yZcikFS6rg4c',
    appId: '1:341930189895:android:fcb07b2ec0ea4094c2fd62',
    messagingSenderId: '341930189895',
    projectId: 'chat-e4883',
    storageBucket: 'chat-e4883.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXzgEB7q65w1Ww-V_RdUOW5opXoPJ-rBg',
    appId: '1:341930189895:ios:25ece95bad692e48c2fd62',
    messagingSenderId: '341930189895',
    projectId: 'chat-e4883',
    storageBucket: 'chat-e4883.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXzgEB7q65w1Ww-V_RdUOW5opXoPJ-rBg',
    appId: '1:341930189895:ios:0eb597930c557386c2fd62',
    messagingSenderId: '341930189895',
    projectId: 'chat-e4883',
    storageBucket: 'chat-e4883.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
