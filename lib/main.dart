import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindshield/my_app.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:iconsax/iconsax.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}


//  Hello Malik