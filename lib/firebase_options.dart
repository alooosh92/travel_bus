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
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAHO87TKJE7GuXwjE7IfzQ7tmcAjWfEfzE',
    appId: '1:376193701894:web:51722cffd92d2eb0cc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    authDomain: 'travel-app-ad5c5.firebaseapp.com',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
    measurementId: 'G-LMFKX2WHGS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnIeCqMyuLR6uTtYxExlC5Ey3bgGKG2HE',
    appId: '1:376193701894:android:26ea26ef2dc30e2bcc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbg8pPdMsQGVJ9OaHycKtIZzbYNcq5w3U',
    appId: '1:376193701894:ios:a25e6b23d0c0082fcc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
    iosClientId: '376193701894-lmhd8grikpe3lhuf1er3i7visfe78uek.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelBus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbg8pPdMsQGVJ9OaHycKtIZzbYNcq5w3U',
    appId: '1:376193701894:ios:a25e6b23d0c0082fcc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
    iosClientId: '376193701894-lmhd8grikpe3lhuf1er3i7visfe78uek.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelBus',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHO87TKJE7GuXwjE7IfzQ7tmcAjWfEfzE',
    appId: '1:376193701894:web:a1730f16e705a46ecc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    authDomain: 'travel-app-ad5c5.firebaseapp.com',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
    measurementId: 'G-6ZHTMZBVNW',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyAHO87TKJE7GuXwjE7IfzQ7tmcAjWfEfzE',
    appId: '1:376193701894:web:51722cffd92d2eb0cc8b87',
    messagingSenderId: '376193701894',
    projectId: 'travel-app-ad5c5',
    authDomain: 'travel-app-ad5c5.firebaseapp.com',
    databaseURL: 'https://travel-app-ad5c5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'travel-app-ad5c5.appspot.com',
    measurementId: 'G-LMFKX2WHGS',
  );
}
