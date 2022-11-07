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
    apiKey: 'AIzaSyCrXaRvZ9qXJfczYBo7E7UtwV9cG-mokJc',
    appId: '1:512421715945:web:996d8663a213654c39f578',
    messagingSenderId: '512421715945',
    projectId: 'buisnessapp-e142b',
    authDomain: 'buisnessapp-e142b.firebaseapp.com',
    storageBucket: 'buisnessapp-e142b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvzenK3xvSNmCGWnceg7u7VvTwovN5g6E',
    appId: '1:512421715945:android:7a8c28f68f68b9b039f578',
    messagingSenderId: '512421715945',
    projectId: 'buisnessapp-e142b',
    storageBucket: 'buisnessapp-e142b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhO1MkCwY_4GOWUpFrB6l6KtORAKZ2LEw',
    appId: '1:512421715945:ios:ef7d67ef12bbc17639f578',
    messagingSenderId: '512421715945',
    projectId: 'buisnessapp-e142b',
    storageBucket: 'buisnessapp-e142b.appspot.com',
    androidClientId: '512421715945-17guslve1ibj1eh057miad7itmfcdhn7.apps.googleusercontent.com',
    iosClientId: '512421715945-vs7rrb02n966ca9j5si93hshki8t36o9.apps.googleusercontent.com',
    iosBundleId: 'com.example.buisness',
  );
}
