import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/old/Pages/compose_mss.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/date_mssg.dart';
import '../../../widgets/old/Widgets/singlemessage.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 21, right: 21, top: 33),
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Message",
              style: TextStyle(color: Constant.theme_col, fontSize: 15),
            ),
            Container(
              width: 100,
              height: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Constant.grey2),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ComposeMessage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 8,
                      color: Constant.theme_col,
                    ),
                    Text(
                      "Compose",
                      style: TextStyle(
                        fontSize: 12,
                        color: Constant.theme_col,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      DateText(date: "2nd Jan,2021"),
      SingleMessageCard(),
      SingleMessageCard(),
      SingleMessageCard(),
      DateText(date: "1st Jan,2021"),
      SingleMessageCard(),
      SingleMessageCard(),
      SingleMessageCard(),
    ]);
  }
}
