import 'package:flutter/material.dart';
import 'package:turp/view/auth/auth_footer.dart';
import 'package:turp/view/auth/auth_header.dart';
import 'package:turp/view/auth/login/ui/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthHeader(
            title: "Welcome back to Turp",
            subtitle: "Login to continue your application",
          ),
          LoginForm(),
          AuthFooter(
            description: "Don't have an account yet?",
            destination: "Register",
          ),
        ],
      ),
    );
  }
}
