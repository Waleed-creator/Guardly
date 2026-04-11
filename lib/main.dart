import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guardly/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Already initialized, ignore
  }

  debugPrint('Firebase connected: ${Firebase.app().name}');
  runApp(MyApp());
}