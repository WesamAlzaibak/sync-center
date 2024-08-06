import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/colors.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      this.hint,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.validator,
      required this.controller});

  final String? hint;
  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 16,color: SyncColors.background),
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 2,
            color: SyncColors.background,
          ),
        ),
        hintText: hint,
        label: label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: SyncColors.background,
        ),
        alignLabelWithHint: true,
        hintStyle: const TextStyle(fontSize: 14, color: SyncColors.pistach),
        prefixIcon: prefixIcon,
        focusedBorder: _outlineInputBorder(color: SyncColors.background),
        enabledBorder: _outlineInputBorder(color: SyncColors.background),
        focusedErrorBorder: _outlineInputBorder(color: SyncColors.red),
        errorBorder: _outlineInputBorder(color: SyncColors.red),
        disabledBorder:
            _outlineInputBorder(color: SyncColors.pistach.withOpacity(0.5)),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 26, vertical: 18),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder({required Color color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
}
