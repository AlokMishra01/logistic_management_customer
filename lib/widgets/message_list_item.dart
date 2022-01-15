import 'package:flutter/cupertino.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class MessageListItem extends StatelessWidget {
  const MessageListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: colors.FIELD_BACKGROUND,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(values.BASE_PADDING),
            child: Icon(
              CupertinoIcons.captions_bubble,
              color: colors.TEXT_BLUE,
              size: 32.0,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: values.BASE_PADDING),
                Text(
                  'Welcome to our platform.',
                  style: TextStyle(
                    color: colors.TEXT_BLACK,
                    fontSize: values.TITLE_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                Text(
                  'Thank you for signing up in our app. We promise to provide the quality service.',
                  style: TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: values.BASE_PADDING),
              ],
            ),
          )
        ],
      ),
    );
  }
}
