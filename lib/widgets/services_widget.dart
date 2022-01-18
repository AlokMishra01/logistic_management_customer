import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: values.BASE_PADDING,
          ),
          child: Text(
            "Our Services",
            style: TextStyle(
              color: colors.TEXT_BLUE,
              fontSize: values.TITLE_TEXT,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: values.BASE_PADDING),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: values.BASE_PADDING),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/services/bus.svg',
                    semanticsLabel: 'Shipment Service Logo',
                    width: 52.0,
                    height: 52.0,
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Shipment Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.TEXT_BLACK,
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                ],
              ),
            ),
            const SizedBox(width: values.BASE_PADDING),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/services/route.svg',
                    semanticsLabel: 'Live GPS Tracking Logo',
                    width: 52.0,
                    height: 52.0,
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Live GPS Tracking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.TEXT_BLACK,
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                ],
              ),
            ),
            const SizedBox(width: values.BASE_PADDING),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/services/secure-shield.svg',
                    semanticsLabel: 'Secure Delivery Logo',
                    width: 52.0,
                    height: 52.0,
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Secure Delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.TEXT_BLACK,
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                ],
              ),
            ),
            const SizedBox(width: values.BASE_PADDING),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/services/cash.svg',
                    semanticsLabel: 'Cash on Delivery Logo',
                    width: 52.0,
                    height: 52.0,
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                  const Text(
                    'Cash on Delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.TEXT_BLACK,
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: values.BASE_PADDING),
                ],
              ),
            ),
            const SizedBox(width: values.BASE_PADDING),
          ],
        ),
      ],
    );
  }
}
