import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FormValidation {
  String? emailValidator(String? email) {
    if (email == null || email == "") {
      return "Enter a value";
    }
    if (!EmailValidator.validate(email)) {
      return "Enter a valid email address";
    }
  }
}
