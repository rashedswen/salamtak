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
    apiKey: 'AIzaSyAG44ijfZqlo2YC7SVxidIKaC6qWgDkUpc',
    appId: '1:47603181237:web:b60152f6af2b0a8031c0fc',
    messagingSenderId: '47603181237',
    projectId: 'salamtak-kwemrj',
    authDomain: 'salamtak-kwemrj.firebaseapp.com',
    storageBucket: 'salamtak-kwemrj.appspot.com',
    measurementId: 'G-D1L3JFXY9E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu3WnOV0dfuTkyrU5kopYg7PSHwRpo9Ks',
    appId: '1:47603181237:android:e72ef75d86198a3331c0fc',
    messagingSenderId: '47603181237',
    projectId: 'salamtak-kwemrj',
    storageBucket: 'salamtak-kwemrj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeYpG59kKSak6_8t1RbT6EOLxkg-fjrHg',
    appId: '1:47603181237:ios:e0668be01a6e117331c0fc',
    messagingSenderId: '47603181237',
    projectId: 'salamtak-kwemrj',
    storageBucket: 'salamtak-kwemrj.appspot.com',
    androidClientId: '47603181237-nn7skb56v6c992td4rf3dqm4dubm5lkj.apps.googleusercontent.com',
    iosClientId: '47603181237-5g6dm58sg076q15h7gf1obdbjh6tqddr.apps.googleusercontent.com',
    iosBundleId: 'com.kwemrj.salamtak',
  );
}
