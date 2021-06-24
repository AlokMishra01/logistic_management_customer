import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomIconBtn extends StatelessWidget {
  int? index, curr_index;
  String? title;
  IconData? iconData;

  CustomIconBtn({this.index, this.curr_index, this.title, this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 44,
      child: Column(
        children: [
          Icon(
            iconData,
            color: (index == curr_index) ? Constant.theme_col : Colors.black,
          ),
          Text(
            title ?? '',
            style: TextStyle(
                fontSize: 10,
                color:
                    (index == curr_index) ? Constant.theme_col : Colors.black),
          )
        ],
      ),
    );
  }
}
