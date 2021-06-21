import 'package:flutter/material.dart';

import '../../../constant.dart';

class DateText extends StatelessWidget {
  String? date;
  DateText({this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 21, right: 21, top: 20),
      width: MediaQuery.of(context).size.width * 1,
      child: Text(
        date ?? '',
        style: TextStyle(color: Constant.unselected, fontSize: 12),
        textAlign: TextAlign.right,
      ),
    );
  }
}
