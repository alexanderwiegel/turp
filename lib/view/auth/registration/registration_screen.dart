import 'package:flutter/material.dart';
import 'package:turp/view/auth/auth_footer.dart';
import 'package:turp/view/auth/auth_header.dart';
import 'package:turp/view/auth/registration/registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: "Welcome to Turp",
              subtitle: "Create an account to start your application",
            ),
            RegistrationForm(),
            AuthFooter(
              description: "Already have an account?",
              destination: "Login",
            )
          ],
        ),
      ),
    );
  }
}
