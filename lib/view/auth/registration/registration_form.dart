import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
import 'package:turp/service/auth.dart';
import 'package:turp/service/validator.dart';
import 'package:turp/widget/turp_button.dart';
import 'package:turp/widget/turp_text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TurpTextFormField.email(
            labelText: "Email",
            hintText: "e.g. max@gmail.com",
            controller: emailController,
            validator: EmailValidator.validate,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          TurpTextFormField.password(
            labelText: "Password",
            hintText: "Enter your password",
            controller: passwordController,
            validator: PasswordValidator.validate,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          TurpTextFormField.password(
            labelText: 'Confirm password',
            hintText: 'Confirm password',
            controller: repeatPasswordController,
            validator: (repeatedPassword) => RepeatedPasswordValidator.validate(
                passwordController.text, repeatedPassword),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          SizedBox(
            width: double.infinity,
            child: TurpButton.primary(
              label: "Register",
              onPressed: () async {
                printInfo("Register button pressed, validating form fields");
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  printSuccess("Successfully validated all form fields");
                  await _auth.registerWithEmailAndPassword(
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
