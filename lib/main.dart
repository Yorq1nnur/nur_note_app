import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nur_note_app/screens/app/app.dart';
import 'package:nur_note_app/services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    App(),
  );
}
