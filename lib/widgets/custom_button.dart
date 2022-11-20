import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onTab;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTab,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color ?? colors.BUTTON_BLUE,
        padding: const EdgeInsets.symmetric(
          vertical: values.BASE_PADDING + 4.0,
        ),
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(values.RADIUS),
        ),
      ),
      onPressed: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
        child: SizedBox(
          width: double.infinity,
          height: 28.0,
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.comfortaa(
                color: colors.TEXT_WHITE,
                fontSize: values.BUTTON_TEXT,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
