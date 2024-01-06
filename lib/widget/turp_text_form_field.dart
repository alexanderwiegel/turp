import 'package:flutter/material.dart';

class TurpTextFormField extends StatefulWidget {
  //#region fields and constructors
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  bool obscure = false;

  TurpTextFormField.name({
    Key? key,
    this.leadingIcon = Icons.person,
    this.trailingIcon,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,
  })  : keyboardType = TextInputType.name,
        super(key: key);

  TurpTextFormField.email({
    Key? key,
    this.leadingIcon = Icons.email,
    this.trailingIcon,
    this.labelText = "Email address",
    this.hintText = "Email",
    required this.controller,
    this.validator,
  })  : keyboardType = TextInputType.emailAddress,
        super(key: key);

  TurpTextFormField.password({
    Key? key,
    this.leadingIcon = Icons.lock,
    this.trailingIcon = Icons.visibility,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.obscure = true,
  })  : keyboardType = TextInputType.visiblePassword,
        super(key: key);

  TurpTextFormField.date({
    Key? key,
    this.leadingIcon = Icons.date_range,
    this.trailingIcon,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,
  })  : keyboardType = TextInputType.datetime,
        super(key: key);

  TurpTextFormField.country({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    required this.labelText,
    this.hintText,
    required this.controller,
    required this.validator,
    this.keyboardType,
  }) : super(key: key);
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
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscure,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        prefixIcon:
            widget.leadingIcon != null ? Icon(widget.leadingIcon) : null,
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
