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
    apiKey: 'AIzaSyAYFdB5eTjw5nxmJLC5krMt6xK8aR6Pnsk',
    appId: '1:860817207908:web:2f1ee620ee45e52af3e571',
    messagingSenderId: '860817207908',
    projectId: 'mathriddle-2718c',
    authDomain: 'mathriddle-2718c.firebaseapp.com',
    storageBucket: 'mathriddle-2718c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcSrCdPbaEtaQ-D8-AFcrDP5_qwFBjw5A',
    appId: '1:860817207908:android:2ad06647e96ac9cef3e571',
    messagingSenderId: '860817207908',
    projectId: 'mathriddle-2718c',
    storageBucket: 'mathriddle-2718c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_j2ncIl8fjEHf-mAm0Q97OpshDH0NSZA',
    appId: '1:860817207908:ios:566469db760e1060f3e571',
    messagingSenderId: '860817207908',
    projectId: 'mathriddle-2718c',
    storageBucket: 'mathriddle-2718c.appspot.com',
    iosBundleId: 'com.prak.uapMobile1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_j2ncIl8fjEHf-mAm0Q97OpshDH0NSZA',
    appId: '1:860817207908:ios:a2e5550383039fc4f3e571',
    messagingSenderId: '860817207908',
    projectId: 'mathriddle-2718c',
    storageBucket: 'mathriddle-2718c.appspot.com',
    iosBundleId: 'com.prak.uapMobile1.RunnerTests',
  );
}
