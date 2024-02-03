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
    apiKey: 'AIzaSyDGR8hXNy0Gi0en1bAoZzZFBM_Dydn0jdw',
    appId: '1:637878406468:web:0782a571365cf9a2281b11',
    messagingSenderId: '637878406468',
    projectId: 'scholar-chat-91b2b',
    authDomain: 'scholar-chat-91b2b.firebaseapp.com',
    storageBucket: 'scholar-chat-91b2b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqAwJdvrLa04RhciV92n4h_upvnvZk664',
    appId: '1:637878406468:android:8d782e796b49f011281b11',
    messagingSenderId: '637878406468',
    projectId: 'scholar-chat-91b2b',
    storageBucket: 'scholar-chat-91b2b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCuUDdRfBBSYXl8LikDesiuR0FGPaVcOU',
    appId: '1:637878406468:ios:c1091ea4e4cbd24c281b11',
    messagingSenderId: '637878406468',
    projectId: 'scholar-chat-91b2b',
    storageBucket: 'scholar-chat-91b2b.appspot.com',
    iosClientId: '637878406468-8lhsounj8q6rnn5pum17lu1vedojs9b0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCuUDdRfBBSYXl8LikDesiuR0FGPaVcOU',
    appId: '1:637878406468:ios:1efa618597a6e906281b11',
    messagingSenderId: '637878406468',
    projectId: 'scholar-chat-91b2b',
    storageBucket: 'scholar-chat-91b2b.appspot.com',
    iosClientId: '637878406468-ibmv8s5dphqmshrdj9r8adr56fodj2ko.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
