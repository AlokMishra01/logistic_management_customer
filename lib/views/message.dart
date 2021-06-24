import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/compose_message.dart';
import 'package:logistic_management_customer/widgets/header.dart';
import 'package:logistic_management_customer/widgets/message_list_item.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/date_text.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(
        title: 'Message',
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ComposeMessage(),
                ),
              );
            },
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.pencil_outline,
                  color: colors.TEXT_BLUE,
                  size: values.BUTTON_TEXT,
                ),
                Text(' Compose '),
              ],
            ),
            style: TextButton.styleFrom(
              backgroundColor: colors.FIELD_BACKGROUND,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              textStyle: TextStyle(
                color: colors.TEXT_BLUE,
                fontSize: values.BUTTON_TEXT,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: values.BASE_PADDING / 4),
      DateText(date: "2nd Jan,2021"),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (_, i) {
          return MessageListItem();
        },
      ),
      SizedBox(height: values.BASE_PADDING / 4),
      DateText(date: "1st Jan,2021"),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (_, i) {
          return MessageListItem();
        },
      ),
    ]);
  }
}
