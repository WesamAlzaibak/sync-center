import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor = SyncColors.background,
    this.iconColor = SyncColors.black,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color iconColor;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Icon(
            Icons.arrow_back,
            color: iconColor,
            size: 16,
            weight: 20,
          ),
        ),
      ),
    );
  }
}
