import 'package:flutter/cupertino.dart';
import 'package:logistic_management_customer/models/notification_response_model.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class MessageListItem extends StatelessWidget {
  final NotificationData notice;

  const MessageListItem({
    Key? key,
    required this.notice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
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
                  notice.title ?? '',
                  // 'Welcome to our platform.',
                  style: const TextStyle(
                    color: colors.TEXT_BLACK,
                    fontSize: values.TITLE_TEXT - 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING / 3),
                Text(
                  notice.description ?? '',
                  // 'Thank you for signing up in our app. We promise to provide the quality service.',
                  style: const TextStyle(
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
