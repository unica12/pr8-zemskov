// ignore_for_file: constant_identifier_names

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
          'DefaultFirebaseOptions have not been configured for Linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAFXdip-FluE-stc1_Nimr4hjdUmkJmfYI',
    appId: '1:89792510746:web:85be2619f9afe51f27caa3',
    messagingSenderId: '89792510746',
    projectId: 'notes-app-andrey',
    authDomain: 'notes-app-andrey.firebaseapp.com',
    storageBucket: 'notes-app-andrey.firebasestorage.app',
    measurementId: 'G-J1L44CP02B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1weRT31K1fBzw5IDBTgGak9DgJm6mNTY',
    appId: '1:89792510746:android:6ab152084ec1495a27caa3',
    messagingSenderId: '89792510746',
    projectId: 'notes-app-andrey',
    storageBucket: 'notes-app-andrey.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKEhtrfsZ_HeRpxwgMYS3sOhHgVoyfvyo',
    appId: '1:89792510746:ios:be5e0f58017037f327caa3',
    messagingSenderId: '89792510746',
    projectId: 'notes-app-andrey',
    storageBucket: 'notes-app-andrey.firebasestorage.app',
    iosBundleId: 'com.example.firebaseNotesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKEhtrfsZ_HeRpxwgMYS3sOhHgVoyfvyo',
    appId: '1:89792510746:ios:be5e0f58017037f327caa3',
    messagingSenderId: '89792510746',
    projectId: 'notes-app-andrey',
    storageBucket: 'notes-app-andrey.firebasestorage.app',
    iosBundleId: 'com.example.firebaseNotesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFXdip-FluE-stc1_Nimr4hjdUmkJmfYI',
    appId: '1:89792510746:web:f745c9311e0ca30327caa3',
    messagingSenderId: '89792510746',
    projectId: 'notes-app-andrey',
    authDomain: 'notes-app-andrey.firebaseapp.com',
    storageBucket: 'notes-app-andrey.firebasestorage.app',
    measurementId: 'G-8DVGWGD113',
  );
}
