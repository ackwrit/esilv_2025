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
    apiKey: 'AIzaSyC9YyIlh0vL5U_mhkQzDjJs_dHN_M0MuC0',
    appId: '1:837778246647:web:6d8025f768b6c892873cf2',
    messagingSenderId: '837778246647',
    projectId: 'esilv2025-974e9',
    authDomain: 'esilv2025-974e9.firebaseapp.com',
    storageBucket: 'esilv2025-974e9.firebasestorage.app',
    measurementId: 'G-CYRL95P7PL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRoRjrHGhfQHzcqkOEveRKXvTtMjrqJvk',
    appId: '1:837778246647:android:a3519f31111cdb70873cf2',
    messagingSenderId: '837778246647',
    projectId: 'esilv2025-974e9',
    storageBucket: 'esilv2025-974e9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC57lQqiior4WrACvwjTyyCF1JK7G2s2Fk',
    appId: '1:837778246647:ios:2a463863a142fb35873cf2',
    messagingSenderId: '837778246647',
    projectId: 'esilv2025-974e9',
    storageBucket: 'esilv2025-974e9.firebasestorage.app',
    iosBundleId: 'com.example.firstApp2025Esilv',
  );
}
