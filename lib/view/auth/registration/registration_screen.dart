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
            child: Column(
              children: [
                Image(image: AssetImage("assets/turkish_flag.png")),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Text(
                  "Welcome to Turp",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                Text(
                  "Create an account to start your application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          RegistrationForm()
        ],
      ),
    );
  }
}
