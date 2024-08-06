import 'package:flutter/material.dart';

import 'app_local.dart';

class AuthValidators {
  static validateCode(String value, BuildContext context) {
    if (value.isEmpty) {
      return getLang(context, "field_required");
    } else if (value.length != 6) {
      return getLang(context, "validate_code_6");
    }
    return null;
  }

  static validatePassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return getLang(context, "field_required");
    } else if (value.length < 8) {
      return getLang(context, "validate_password");
    }
    return null;
  }

  static validateLoginPassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return getLang(context, "field_required");
    }
    return null;
  }

  static validateConfirm(String value, String value2, BuildContext context) {
    if (value.isEmpty) {
      return getLang(context, "field_required");
    } else if (value != value2) {
      return getLang(context, "validate_confirm");
    }
    return null;
  }

  static validateEmpty(String value, BuildContext context) {
    if (value.isEmpty) {
      return getLang(context, "field_required");
    }
    return null;
  }

  static validateEmail(String value, BuildContext context) {
   validateEmpty(value, context);
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return getLang(context, "validate_email");
    }
    return null;
  }

}
