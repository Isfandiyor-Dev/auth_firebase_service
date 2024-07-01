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
    apiKey: 'AIzaSyD6AHgU8Zofn0rcy8NODluAv2FcHAFmywc',
    appId: '1:844662951423:web:292b995a6fedad97b56bca',
    messagingSenderId: '844662951423',
    projectId: 'lesson-3d006',
    authDomain: 'lesson-3d006.firebaseapp.com',
    storageBucket: 'lesson-3d006.appspot.com',
    measurementId: 'G-LESH7MCGF1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD86ThUgVaFwE2cLCAeW0EeV263N1_KXQ0',
    appId: '1:844662951423:android:fd2b65a1a8d6facdb56bca',
    messagingSenderId: '844662951423',
    projectId: 'lesson-3d006',
    storageBucket: 'lesson-3d006.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM5fZT-O1NUOOW3vrIQ3MCLfZky9D_NfM',
    appId: '1:844662951423:ios:ceb8bbb23e98ca83b56bca',
    messagingSenderId: '844662951423',
    projectId: 'lesson-3d006',
    storageBucket: 'lesson-3d006.appspot.com',
    iosBundleId: 'com.example.authFirebaseService',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCM5fZT-O1NUOOW3vrIQ3MCLfZky9D_NfM',
    appId: '1:844662951423:ios:ceb8bbb23e98ca83b56bca',
    messagingSenderId: '844662951423',
    projectId: 'lesson-3d006',
    storageBucket: 'lesson-3d006.appspot.com',
    iosBundleId: 'com.example.authFirebaseService',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6AHgU8Zofn0rcy8NODluAv2FcHAFmywc',
    appId: '1:844662951423:web:34b8169efbf698d2b56bca',
    messagingSenderId: '844662951423',
    projectId: 'lesson-3d006',
    authDomain: 'lesson-3d006.firebaseapp.com',
    storageBucket: 'lesson-3d006.appspot.com',
    measurementId: 'G-41HY0CC432',
  );
}
