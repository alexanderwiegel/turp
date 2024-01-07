import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
import 'package:turp/service/auth.dart';
import 'package:turp/service/validator.dart';
import 'package:turp/view/admin/admin_screen.dart';
import 'package:turp/view/application/step1.dart';
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
          SizedBox(
            width: double.infinity,
            child: TurpButton.primary(
              label: "Login",
              onPressed: () async {
                printInfo("Login button pressed, validating form fields");
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  printSuccess("Successfully validated all form fields");
                  final result = await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  if (result != null) {
                    dynamic destination;
                    destination = (emailController.text ==
                                "alexander.wiegel@ieu.edu.tr" &&
                            passwordController.text == "123456")
                        ? const AdminScreen()
                        : const Step1();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => destination,
                        ),
                        (route) => false);
                  }
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
