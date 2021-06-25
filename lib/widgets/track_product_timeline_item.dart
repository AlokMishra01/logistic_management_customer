import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class TrackProductTimelineItem extends StatelessWidget {
  final bool isStart;
  final bool isEnd;
  final bool done;
  final String title;

  const TrackProductTimelineItem({
    Key? key,
    this.isStart = false,
    this.isEnd = false,
    this.done = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      isFirst: isStart,
      isLast: isEnd,
      indicatorStyle: IndicatorStyle(
        color: colors.BUTTON_BLUE,
        width: 18,
        padding: const EdgeInsets.symmetric(
          horizontal: values.BASE_PADDING,
        ),
        indicator: CircleAvatar(
          backgroundColor: colors.BUTTON_BLUE,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 6,
              backgroundColor: done ? colors.BUTTON_BLUE : colors.TEXT_WHITE,
            ),
          ),
        ),
      ),
      afterLineStyle: LineStyle(color: colors.BUTTON_BLUE, thickness: 4),
      beforeLineStyle: LineStyle(color: colors.BUTTON_BLUE, thickness: 4),
      lineXY: 0.1,
      endChild: Container(
        padding: const EdgeInsets.symmetric(
          vertical: values.BASE_PADDING,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: done ? colors.TEXT_BLUE : colors.BUTTON_GREEN,
                  height: 1.25,
                ),
              ),
            ),
            SizedBox(width: values.BASE_PADDING),
          ],
        ),
      ),
      startChild: Container(),
    );
  }
}
