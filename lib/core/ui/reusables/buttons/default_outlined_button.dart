import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DefaultOutlinedButton extends StatelessWidget {
  const DefaultOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.textColor,
      required this.borderColor,
      required this.width,
      this.isLoading = false,
      this.enabled = true});

  final void Function() onPressed;
  final Color textColor;
  final Color borderColor;
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: 48,
      elevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 1.25)),
      onPressed: enabled && !isLoading ? onPressed : null,
      color: Colors.transparent,
      disabledColor: SyncColors.darkBlue.withOpacity(0.5),
      textColor: textColor,
      disabledTextColor: Colors.white.withOpacity(0.5),
      child: Builder(builder: (context) {
        if (isLoading) {
          return const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.5,
            ),
          );
        } else {
          return Text(
            text,
            style: const TextStyle(fontSize: 16),
          );
        }
      }),
    );
  }
}
