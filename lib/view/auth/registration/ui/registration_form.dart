import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
import 'package:turp/widget/turp_text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            const TurpTextFormField.name(
              name: "username",
              labelText: "Full name",
              hintText: "e.g. Max Mustermann",
            ),
            const TurpTextFormField.email(
              name: "email",
              labelText: "Email",
              hintText: "e.g. max@gmail.com",
            ),
            TextButton(
              onPressed: () => printInfo("Submit button pressed"),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
