import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
import 'package:turp/service/auth.dart';
import 'package:turp/widget/turp_button.dart';
import 'package:turp/widget/turp_text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final AuthService _auth = AuthService();
  //final _signUpKey = GlobalKey<FormState>();

  // List<Text> signUpErrors = [];
  // late final Text emailError;
  // late final Text passwordError;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   emailError = errorMessage("Please enter a valid email address");
  //   passwordError =
  //       errorMessage("Passwords must be at least 6 characters long");
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            TurpTextFormField.email(
              name: "email",
              labelText: "Email",
              hintText: "e.g. max@gmail.com",
              controller: emailController,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TurpTextFormField.password(
              name: "password",
              labelText: "Password",
              hintText: "Enter your password",
              controller: passwordController,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            SizedBox(
              width: double.infinity,
              child: TurpButton.primary(
                label: "Register",
                onPressed: () async {
                  printInfo("Submit button pressed");
                  await _auth.registerWithEmailAndPassword(
                      emailController.text, passwordController.text);
                },
              ),
            )
            // showErrors(signUpErrors)
          ],
        ),
      ),
    );
  }

  // Text errorMessage(String text) {
  //   return Text(
  //     text,
  //     textAlign: TextAlign.center,
  //     style: const TextStyle(color: Colors.amber),
  //   );
  // }
  //
  // Widget showErrors(List<Text> errors) {
  //   return Visibility(
  //     visible: errors.isNotEmpty,
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 10),
  //       child: Column(children: errors),
  //     ),
  //   );
  // }
  //
  // void validate(bool condition, List<Text> errors, Text error) {
  //   errors.remove(error);
  //   if (condition) setState(() => errors.add(error));
  // }
}
