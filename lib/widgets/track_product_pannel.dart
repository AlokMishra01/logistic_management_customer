import 'package:flutter/material.dart';

import 'track_product_timeline_item.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class TrackProductPannel extends StatelessWidget {
  final ScrollController controller;

  const TrackProductPannel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: controller,
        children: <Widget>[
          SizedBox(height: values.BASE_PADDING),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.TEXT_BLACK,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: values.BASE_PADDING),
          Text(
            "Product Code: XXXX",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: values.TITLE_TEXT,
              color: colors.TEXT_BLUE,
            ),
          ),
          SizedBox(height: values.BASE_PADDING / 2),
          Text(
            "Delivery Status: Pending",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: values.TITLE_TEXT,
              color: colors.TEXT_BLACK,
            ),
          ),
          SizedBox(height: values.BASE_PADDING),
          TrackProductTimelineItem(
            title: 'Received in collection zone',
            isStart: true,
            done: true,
          ),
          TrackProductTimelineItem(title: 'Warehouse in Kathmandu', done: true),
          TrackProductTimelineItem(title: 'Delivery Agent (On the way)'),
          TrackProductTimelineItem(title: 'Delivered', isEnd: true),
          SizedBox(height: values.BASE_PADDING * 2),
        ],
      ),
    );
  }
}
