import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class MessageListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      color: colors.FIELD_BACKGROUND,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(values.BASE_PADDING),
            child: Icon(
              CupertinoIcons.captions_bubble,
              color: colors.TEXT_BLUE,
              size: size.width * 0.1,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to our platform.',
                  style: TextStyle(
                    color: colors.TEXT_BLACK,
                    fontSize: values.TITLE_TEXT - 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: values.BASE_PADDING / 3),
                Text(
                  'Thank you for signing up in our app. We promise to provide the quality service.',
                  style: TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
