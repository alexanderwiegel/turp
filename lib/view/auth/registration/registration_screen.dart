import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:turp/view/auth/auth_footer.dart';
import 'package:turp/view/auth/auth_header.dart';
import 'package:turp/view/auth/registration/ui/registration_form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
            return isKeyboardVisible
                ? const SizedBox.shrink()
                : const AuthHeader(
                    title: "Welcome to Turp",
                    subtitle: "Create an account to start your application",
                  );
          }),
          const RegistrationForm(),
          KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
            return isKeyboardVisible
                ? const SizedBox.shrink()
                : const AuthFooter(
                    description: "Already have an account?",
                    destination: "Login",
                  );
          })
        ],
      ),
    );
  }
}
