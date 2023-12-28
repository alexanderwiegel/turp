import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:turp/view/auth/auth_footer.dart';
import 'package:turp/view/auth/auth_header.dart';
import 'package:turp/view/auth/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) {
              return isKeyboardVisible
                  ? const SizedBox.shrink()
                  : const AuthHeader(
                      title: "Welcome back to Turp",
                      subtitle: "Login to continue your application",
                    );
            },
          ),
          const LoginForm(),
          const AuthFooter(
            description: "Don't have an account yet?",
            destination: "Register",
          ),
        ],
      ),
    );
  }
}
