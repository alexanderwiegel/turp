import 'package:flutter/material.dart';

class RegistrationScreenDescription extends StatelessWidget {
  const RegistrationScreenDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
        )
      ],
    );
  }
}
