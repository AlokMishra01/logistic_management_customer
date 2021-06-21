import 'package:flutter/material.dart';

import '../../../constant.dart';

class DetailUserSingle extends StatelessWidget {
  String? title, value;
  DetailUserSingle({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 21, right: 21, top: 9),
      width: MediaQuery.of(context).size.width,
      child: RichText(
        text: TextSpan(
            text: title ?? ' ' + " :",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w300),
            children: [
              TextSpan(
                  text: value,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87))
            ]),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  String info;
  Heading(this.info);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(left: 21, right: 21, top: 26),
      width: MediaQuery.of(context).size.width,
      height: 28,
      decoration: BoxDecoration(
        color: Constant.grey1,
      ),
      child: Text(
        info,
        style: TextStyle(fontSize: 14, color: Constant.theme_col),
      ),
    );
  }
}
