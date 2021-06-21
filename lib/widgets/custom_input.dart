import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final List<TextInputFormatter> formatters;
  final TextFieldValidator? validator;
  final bool obscureText;

  const CustomInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.type = TextInputType.text,
    this.formatters = const [],
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(values.RADIUS),
          borderSide: BorderSide(width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(values.RADIUS),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        fillColor: colors.FIELD_BACKGROUND,
        filled: true,
        focusColor: colors.TEXT_SECONDARY,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(values.RADIUS),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: colors.TEXT_SECONDARY,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      ),
      style: TextStyle(
        color: colors.TEXT_BLACK,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      enableSuggestions: true,
      inputFormatters: formatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ?? MinLengthValidator(0, errorText: ''),
      keyboardType: type,
      obscureText: obscureText,
      controller: controller,
    );
  }
}
