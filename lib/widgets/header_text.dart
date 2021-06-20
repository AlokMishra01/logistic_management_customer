import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: values.HEADER_TEXT,
        color: colors.TEXT_BLUE,
      ),
    );
  }
}
