import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class JoinUsTodayWidget extends StatelessWidget {
  const JoinUsTodayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: values.BASE_PADDING,
        vertical: values.BASE_PADDING,
      ),
      child: Container(
        padding: const EdgeInsets.all(values.BASE_PADDING),
        decoration: BoxDecoration(
          color: colors.BUTTON_BLUE,
          borderRadius: BorderRadius.circular(values.RADIUS),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Be our Partner to connect with us and add an extra '
              'quality to your service. Take your Business and transport '
              'to Next Level',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: values.DETAILS_TEXT,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  launch('https://logistics.intopros.com.np/membership');
                },
                child: Text(
                  'Join us Today',
                  style: GoogleFonts.comfortaa(
                    color: colors.TEXT_BLUE,
                    fontSize: values.DETAILS_TEXT,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: colors.FIELD_BACKGROUND,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(values.RADIUS),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
