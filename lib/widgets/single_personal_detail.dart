import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class ProfileDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$title : ',
          style: TextStyle(
            fontSize: values.DETAILS_TEXT + 2,
            color: colors.TEXT_SECONDARY,
            fontWeight: FontWeight.w400,
            height: 2,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: values.DETAILS_TEXT + 2,
                fontWeight: FontWeight.w500,
                color: colors.TEXT_BLACK,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
