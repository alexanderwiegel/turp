import 'package:flutter/material.dart';
import 'package:turp/view/auth/login/login_screen.dart';
import 'package:turp/view/auth/registration/registration_screen.dart';

class AuthFooter extends StatelessWidget {
  final String description;
  final String destination;

  const AuthFooter({
    super.key,
    required this.description,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                    destination == "Login"
                        ? const LoginScreen()
                        : const RegistrationScreen(),
                ),
                (route) => false);
          },
          child: Text(
            "$destination here",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
