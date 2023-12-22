import 'package:flutter/material.dart';

class TurpTextFormField extends StatefulWidget {
  //#region fields and constructors
  final String name;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  bool obscure = false;

  TurpTextFormField.name({
    Key? key,
    required this.name,
    this.leadingIcon = Icons.person,
    this.trailingIcon,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.obscure = false,
  })  : keyboardType = TextInputType.name,
        super(key: key);

  TurpTextFormField.email({
    Key? key,
    required this.name,
    this.leadingIcon = Icons.email,
    this.trailingIcon,
    this.labelText = "Email address",
    this.hintText = "Email",
    required this.controller,
    this.obscure = false,
  })  : keyboardType = TextInputType.emailAddress,
        super(key: key);

  TurpTextFormField.password({
    Key? key,
    required this.name,
    this.leadingIcon = Icons.lock,
    this.trailingIcon = Icons.visibility,
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
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon: Icon(widget.leadingIcon),
        suffixIcon: widget.trailingIcon != null
            ? IconButton(
                icon: Icon(
                    !widget.obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () =>
                    setState(() => widget.obscure = !widget.obscure))
            : null,
      ),
    );
  }
}