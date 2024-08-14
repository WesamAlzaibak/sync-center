import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../theme/colors.dart';

class OneTimePasswordTextField extends StatelessWidget {
  OneTimePasswordTextField({
    super.key,
    required this.length,
    required this.pinController,
    required this.onChanged,
  });

  final int length;
  final TextEditingController pinController;
  final Function onChanged;

  final defaultPinTheme = PinTheme(
    width: 58,
    height: 58,
    textStyle: const TextStyle(
      fontSize: 22,
      color: SyncColors.black,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: SyncColors.darkBlue),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length,
      onChanged: (value) => onChanged(value),
      controller: pinController,
      defaultPinTheme: defaultPinTheme,
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(
            color: SyncColors.red,
          ),
        ),
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(5),
      ],
      enabled: true,
      disabledPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: SyncColors.background),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: SyncColors.darkBlue),
        ),
      ),
    );
  }
}
