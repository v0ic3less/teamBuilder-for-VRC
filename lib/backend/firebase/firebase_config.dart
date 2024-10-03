import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBaDFO0uhYNnBLpQDWvWqdAfC8EuS4VK1M",
            authDomain: "vrc-team-builder-app.firebaseapp.com",
            projectId: "vrc-team-builder-app",
            storageBucket: "vrc-team-builder-app.appspot.com",
            messagingSenderId: "929910681984",
            appId: "1:929910681984:web:6b0e7935f0b5dafd915165",
            measurementId: "G-G0XD215P32"));
  } else {
    await Firebase.initializeApp();
  }
}
