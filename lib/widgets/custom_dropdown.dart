import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class CustomDropdown extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final List<TextInputFormatter> formatters;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconData? icon;
  final VoidCallback? onSuffixTab;
  final VoidCallback? onTab;
  final bool enabled;
  final int? maxLines;
  final int? minLines;

  const CustomDropdown({
    Key? key,
    required this.hint,
    this.type = TextInputType.text,
    this.formatters = const [],
    this.validator,
    this.obscureText = false,
    this.icon,
    this.onSuffixTab,
    this.onTab,
    this.enabled = true,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: DropdownButtonFormField<dynamic>(
        items: ['dsjfk', 'skdkjs']
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
              ),
            )
            .toList(),
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
          disabledBorder: OutlineInputBorder(
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
          suffixIcon: icon != null
              ? IconButton(
                  onPressed: onSuffixTab,
                  icon: Icon(icon),
                  color: colors.TEXT_BLUE,
                )
              : null,
        ),
        style: TextStyle(
          color: colors.TEXT_BLACK,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {},
      ),
    );
  }
}
