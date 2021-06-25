import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logistic_management_customer/widgets/header.dart';
import 'package:logistic_management_customer/widgets/track_product_map.dart';
import 'package:logistic_management_customer/widgets/track_product_pannel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class TrackProduct extends StatelessWidget {
  TrackProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(title: 'Track', backButton: true),
            Text(
              "Delivery Status: Pending",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: values.DETAILS_TEXT,
                color: colors.TEXT_BLACK,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            Expanded(
              child: Material(
                child: SlidingUpPanel(
                  maxHeight: size.height * 0.5,
                  minHeight: 100,
                  parallaxEnabled: true,
                  parallaxOffset: .5,
                  body: TrackProductMap(),
                  panelBuilder: (controller) => TrackProductPannel(
                    controller: controller,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(values.RADIUS),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
