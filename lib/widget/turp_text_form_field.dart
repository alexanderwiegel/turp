import 'package:flutter/material.dart';

class TurpTextFormField extends StatefulWidget {
  //#region fields and constructors
  final String name;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const TurpTextFormField.name({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.controller,
  }) : keyboardType = TextInputType.name,
        super(key: key);

  const TurpTextFormField.email({
    Key? key,
    required this.name,
    this.labelText = "Email address",
    this.hintText = "Email",
    this.controller,
  })  : keyboardType = TextInputType.emailAddress,
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText
      ),
    );
  }
}
