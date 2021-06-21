import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constant.dart';

class CustomTimeLine extends StatelessWidget {
  String? title;
  bool iscomplete;
  CustomTimeLine({this.title, this.iscomplete = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: SizedBox(
        height: 50,
        child: TimelineTile(
          hasIndicator: true,
          alignment: TimelineAlign.start,
          endChild: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "$title",
              style: TextStyle(
                  color: iscomplete ? Constant.theme_col : Constant.green),
            ),
          ),
          indicatorStyle: IndicatorStyle(
            height: 15,
            width: 15,
            indicator: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: Constant.theme_col,
                    width: 1,
                    style: BorderStyle.solid),
                color: (iscomplete) ? Constant.theme_col : Colors.white,
              ),
            ),
            drawGap: true,
          ),
        ),
      ),
    );
  }
}
