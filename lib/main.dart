import 'package:flutter/material.dart';

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
    );
  }
}