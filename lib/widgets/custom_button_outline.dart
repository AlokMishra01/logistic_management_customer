import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class CustomButtonOutline extends StatelessWidget {
  final String title;
  final VoidCallback onTab;

  CustomButtonOutline({required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        backgroundColor: colors.TEXT_WHITE,
        padding: EdgeInsets.symmetric(vertical: values.BASE_PADDING + 4.0),
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(values.RADIUS),
        ),
        side: BorderSide(
          color: colors.BUTTON_BLUE,
          width: 1,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: colors.BUTTON_BLUE,
              fontSize: values.BUTTON_TEXT,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      onPressed: onTab,
    );
  }
}
