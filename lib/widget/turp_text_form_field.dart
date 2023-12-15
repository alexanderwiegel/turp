import 'package:flutter/material.dart';

class TurpTextFormField extends StatefulWidget {
  //#region fields and constructors
  final String name;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscure;

  const TurpTextFormField.name({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.obscure = false,
  })  : keyboardType = TextInputType.name,
        super(key: key);

  const TurpTextFormField.email({
    Key? key,
    required this.name,
    this.labelText = "Email address",
    this.hintText = "Email",
    required this.controller,
    this.obscure = false,
  })  : keyboardType = TextInputType.emailAddress,
        super(key: key);

  const TurpTextFormField.password({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.obscure = true,
  })  : keyboardType = TextInputType.visiblePassword,
        super(key: key);
  //#endregion

  @override
  State<TurpTextFormField> createState() => _TurpTextFormFieldState();
}

class _TurpTextFormFieldState extends State<TurpTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscure,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: widget.hintText, labelText: widget.labelText),
    );
  }
}
