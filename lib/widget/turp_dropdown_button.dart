import 'package:flutter/material.dart';

class TurpDropdownButton extends StatefulWidget {
  final String labelText;
  String? value;
  final List<String> items;
  final IconData? icon;
  final Function(dynamic) onChanged;
  final String? Function(String?)? validator;

  TurpDropdownButton({
    Key? key,
    required this.labelText,
    this.value,
    required this.items,
    this.icon,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  State<TurpDropdownButton> createState() => _TurpDropdownButtonState();
}

class _TurpDropdownButtonState extends State<TurpDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        key: widget.key,
        value: widget.value,
        onChanged: widget.onChanged,
        validator: widget.validator,
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.icon == null ? null : Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
