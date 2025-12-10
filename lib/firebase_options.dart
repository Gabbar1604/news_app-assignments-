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
    apiKey: 'AIzaSyAqi4b64MkC5dkishpUcZCBb9mjV1K3ufc',
    appId: '1:199890042136:web:8504f03835e475577db26d',
    messagingSenderId: '199890042136',
    projectId: 'newsapp-d132a',
    authDomain: 'newsapp-d132a.firebaseapp.com',
    storageBucket: 'newsapp-d132a.firebasestorage.app',
    measurementId: 'G-TYJLN2P1Y9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx2EcnXZ7Y7kwaJYwBrYd8rOSYnHHRUAc',
    appId: '1:199890042136:android:78b173f4063c5ee57db26d',
    messagingSenderId: '199890042136',
    projectId: 'newsapp-d132a',
    storageBucket: 'newsapp-d132a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD96NvJFeS2IdMgZVhHJ6bZgQywKydv9N4',
    appId: '1:199890042136:ios:4f2c7e59288d6a757db26d',
    messagingSenderId: '199890042136',
    projectId: 'newsapp-d132a',
    storageBucket: 'newsapp-d132a.firebasestorage.app',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD96NvJFeS2IdMgZVhHJ6bZgQywKydv9N4',
    appId: '1:199890042136:ios:4f2c7e59288d6a757db26d',
    messagingSenderId: '199890042136',
    projectId: 'newsapp-d132a',
    storageBucket: 'newsapp-d132a.firebasestorage.app',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAqi4b64MkC5dkishpUcZCBb9mjV1K3ufc',
    appId: '1:199890042136:web:bbb2ee3988fd88137db26d',
    messagingSenderId: '199890042136',
    projectId: 'newsapp-d132a',
    authDomain: 'newsapp-d132a.firebaseapp.com',
    storageBucket: 'newsapp-d132a.firebasestorage.app',
    measurementId: 'G-TRLSZ84RZN',
  );
}
