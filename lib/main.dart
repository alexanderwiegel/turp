import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turp/view/application/step1.dart';

import 'constants.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // The "instance" getter on the ServicesBinding binding mixin is only available once that binding has been initialized.
  WidgetsFlutterBinding
      .ensureInitialized(); // To avoid "Unhandled Exception: Binding has not yet been initialized."
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Turkish Residence Permit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: mainColor),
        home: const Step1());
  }
}
