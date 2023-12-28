import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
import 'package:turp/service/auth.dart';
import 'package:turp/service/validator.dart';
import 'package:turp/widget/turp_button.dart';
import 'package:turp/widget/turp_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TurpTextFormField.email(
            name: "email",
            labelText: "Email",
            hintText: "e.g. max@gmail.com",
            controller: emailController,
            validator: EmailValidator.validate,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          TurpTextFormField.password(
            name: "password",
            labelText: "Password",
            hintText: "Enter your password",
            controller: passwordController,
            validator: PasswordValidator.validate,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          SizedBox(
            width: double.infinity,
            child: TurpButton.primary(
              label: "Login",
              onPressed: () async {
                printInfo("Login button pressed, validating form fields");
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  printSuccess("Successfully validated all form fields");
                  await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
