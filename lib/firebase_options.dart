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
    apiKey: 'AIzaSyC6D9T7TPHKfNE_HoNdiW8txKs5A5X5mC8',
    appId: '1:887824952505:web:85676f168ac6fc310d3f68',
    messagingSenderId: '887824952505',
    projectId: 'myapp-project-59a5f',
    authDomain: 'myapp-project-59a5f.firebaseapp.com',
    storageBucket: 'myapp-project-59a5f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTIHRDy1L1Hc7mdhFDEFXawem7_UhGSNc',
    appId: '1:887824952505:android:ebf612b5f89805d20d3f68',
    messagingSenderId: '887824952505',
    projectId: 'myapp-project-59a5f',
    storageBucket: 'myapp-project-59a5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBadIXDUiV4kn01HffVVA51HGZU9YQ8FVo',
    appId: '1:887824952505:ios:d157bc2652a74da80d3f68',
    messagingSenderId: '887824952505',
    projectId: 'myapp-project-59a5f',
    storageBucket: 'myapp-project-59a5f.appspot.com',
    iosClientId: '887824952505-6mm40urj2kghpsodkam5badq4tsrniap.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBadIXDUiV4kn01HffVVA51HGZU9YQ8FVo',
    appId: '1:887824952505:ios:d157bc2652a74da80d3f68',
    messagingSenderId: '887824952505',
    projectId: 'myapp-project-59a5f',
    storageBucket: 'myapp-project-59a5f.appspot.com',
    iosClientId: '887824952505-6mm40urj2kghpsodkam5badq4tsrniap.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}