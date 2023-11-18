import 'package:flutter/material.dart';
import 'package:turp/view/auth/registration/registration_screen.dart';

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turkish Residence Permit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mainColor),
      home: const RegistrationScreen()
    );
  }
}