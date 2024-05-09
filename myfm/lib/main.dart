import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfm/firebase_options.dart';

Future<void> main() async {
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Load all the Material Design, Themes, Localizations, Bindings
  runApp(const App());
}
