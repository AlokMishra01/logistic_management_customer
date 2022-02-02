import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/message_response_model.dart';
import 'package:logistic_management_customer/views/message_details.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class MessageListItem extends StatelessWidget {
  final MessageModel message;

  const MessageListItem({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MessageDetails(model: message),
          ),
        );
      },
      child: Container(
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
                children: [
                  const SizedBox(height: values.BASE_PADDING),
                  Text(
                    message.subject ?? '',
                    style: const TextStyle(
                      color: colors.TEXT_BLACK,
                      fontSize: values.TITLE_TEXT,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING / 2),
                  Text(
                    message.message ?? '',
                    style: const TextStyle(
                      color: colors.TEXT_SECONDARY,
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
