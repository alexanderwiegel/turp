import 'package:flutter/material.dart';
import 'package:turp/view/auth/registration/ui/registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(color: Colors.black),
            ),
          ),
          RegistrationForm()
        ],
      ),
    );
  }
}
