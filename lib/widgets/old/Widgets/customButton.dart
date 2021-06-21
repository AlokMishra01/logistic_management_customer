import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomButton extends StatelessWidget {
  String? title;
  Function pressed;

  CustomButton({this.title, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 52,
      decoration: BoxDecoration(
          color: Constant.theme_col, borderRadius: BorderRadius.circular(6)),
      child: FlatButton(
        child: Text(
          title ?? '',
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
        ),
        onPressed: () => pressed,
      ),
    );
  }
}
