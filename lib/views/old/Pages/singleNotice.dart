import 'package:flutter/material.dart';

import '../../../constant.dart';

class SingleNotice extends StatefulWidget {
  @override
  _SingleNoticeState createState() => _SingleNoticeState();
}

class _SingleNoticeState extends State<SingleNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Constant.theme_col,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Blog/News",
            style: TextStyle(color: Constant.theme_col, fontSize: 24),
            textAlign: TextAlign.left,
          ),
          titleSpacing: -10,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 223,
              margin: EdgeInsets.only(left: 34, right: 34),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage("images/banner2.png"),
                      fit: BoxFit.contain)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 34, right: 34, top: 10),
              child: RichText(
                  text: TextSpan(
                      text: "Opening Day Delivery",
                      style: TextStyle(
                          color: Constant.theme_col,
                          fontWeight: FontWeight.w700,
                          fontSize: 18))),
            ),
            Container(
              width: 312,
              margin: EdgeInsets.only(left: 34, right: 34, top: 7),
              child: RichText(
                text: TextSpan(
                  text:
                      "Our delivery service started from the date of 2nd Jan, 2021 ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            )
          ],
        ));
  }
}
