import 'package:flutter/material.dart';

class TurpButton extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Function() onPressed;
  final bool enabled;
  final bool loading;
  final bool outlined;

  const TurpButton.primary({
    required this.label,
    Key? key,
    this.color,
    this.textColor,
    this.disabledColor,
    this.textStyle,
    this.padding,
    required this.onPressed,
    this.enabled = true,
    this.loading = false,
  })  : outlined = false,
        super(key: key);

  const TurpButton.secondary({
    required this.label,
    Key? key,
    this.color,
    this.textColor,
    this.disabledColor,
    this.textStyle,
    this.padding,
    required this.onPressed,
    this.enabled = true,
    this.loading = false,
  })  : outlined = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = this.color ?? theme.colorScheme.secondary;
    final textColor = this.textColor ??
        (outlined ? theme.colorScheme.secondary : Colors.white);
    final disabledColor = this.disabledColor ?? Theme.of(context).disabledColor;
    final TextStyle textStyle = this.textStyle ?? theme.textTheme.titleLarge!;

    if (outlined) {
      //secondary button
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side:
              BorderSide(color: (enabled && !loading) ? color : disabledColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Text(
                loading ? '' : label,
                style: textStyle.copyWith(
                    color: enabled ? textColor : disabledColor),
              ),
              if (loading) loader(textStyle.fontSize)
            ],
          ),
        ),
      );
    } else {
      //primary button
      return MaterialButton(
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color,
        disabledColor: disabledColor,
        onPressed: (enabled && !loading) ? onPressed : null,
        child: Stack(
          children: [
            Text(
              loading ? '' : label,
              style: textStyle.copyWith(color: textColor),
            ),
            if (loading) loader(textStyle.fontSize)
          ],
        ),
      );
    }
  }

  Widget loader(double? fontSize) {
    return SizedBox(
      height: fontSize,
      width: fontSize,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: textColor,
      ),
    );
  }
}
