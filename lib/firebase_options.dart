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
    apiKey: 'AIzaSyAwKnBAk1MjKw9O6ngItTmouI9gZYtZZP0',
    appId: '1:162912217479:web:6e2139b7f887619903cb22',
    messagingSenderId: '162912217479',
    projectId: 'tarcar-f8f5d',
    authDomain: 'tarcar-f8f5d.firebaseapp.com',
    storageBucket: 'tarcar-f8f5d.firebasestorage.app',
    measurementId: 'G-XHJB1535JE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKgMy0e-WZqqq_eRUTPynsmZ-KslGxGus',
    appId: '1:162912217479:android:785ba4d1c6e48da803cb22',
    messagingSenderId: '162912217479',
    projectId: 'tarcar-f8f5d',
    storageBucket: 'tarcar-f8f5d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJshRhiQGVi5wSdlXnGiDTvbTI34rmP6w',
    appId: '1:162912217479:ios:fae7fced362872d203cb22',
    messagingSenderId: '162912217479',
    projectId: 'tarcar-f8f5d',
    storageBucket: 'tarcar-f8f5d.firebasestorage.app',
    iosBundleId: 'com.example.tarcar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJshRhiQGVi5wSdlXnGiDTvbTI34rmP6w',
    appId: '1:162912217479:ios:fae7fced362872d203cb22',
    messagingSenderId: '162912217479',
    projectId: 'tarcar-f8f5d',
    storageBucket: 'tarcar-f8f5d.firebasestorage.app',
    iosBundleId: 'com.example.tarcar',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwKnBAk1MjKw9O6ngItTmouI9gZYtZZP0',
    appId: '1:162912217479:web:3ea6332456e6ee7f03cb22',
    messagingSenderId: '162912217479',
    projectId: 'tarcar-f8f5d',
    authDomain: 'tarcar-f8f5d.firebaseapp.com',
    storageBucket: 'tarcar-f8f5d.firebasestorage.app',
    measurementId: 'G-QXES2LGGVS',
  );

}