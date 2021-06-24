import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class DateText extends StatelessWidget {
  final String date;

  const DateText({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          date,
          style: TextStyle(
            color: colors.TEXT_SECONDARY,
            fontSize: values.DETAILS_TEXT,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.right,
        ),
        SizedBox(width: values.BASE_PADDING),
      ],
    );
  }
}
