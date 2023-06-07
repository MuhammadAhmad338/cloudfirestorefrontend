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
    apiKey: 'AIzaSyDvwZ3_RIwPQy09j_Bgy4wlSndZ9ZVldhU',
    appId: '1:230695286168:web:79d45b6d1467027f02a7ed',
    messagingSenderId: '230695286168',
    projectId: 'cloud-3de19',
    authDomain: 'cloud-3de19.firebaseapp.com',
    storageBucket: 'cloud-3de19.appspot.com',
    measurementId: 'G-9K5XHV2Q51',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBalFHQCXJvWg92ml8flq5HaHAjay-TMxg',
    appId: '1:230695286168:android:771f38ddfda7d24402a7ed',
    messagingSenderId: '230695286168',
    projectId: 'cloud-3de19',
    storageBucket: 'cloud-3de19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdEQWXrHDjxNy-3LFwZu5PKrUMNeK-vXs',
    appId: '1:230695286168:ios:04d392053222809a02a7ed',
    messagingSenderId: '230695286168',
    projectId: 'cloud-3de19',
    storageBucket: 'cloud-3de19.appspot.com',
    iosClientId: '230695286168-ec08ktr17fd7gb0u4prah22dqnigepeo.apps.googleusercontent.com',
    iosBundleId: 'com.example.googlecloud',
  );
}