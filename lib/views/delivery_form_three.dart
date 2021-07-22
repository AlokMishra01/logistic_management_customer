import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_input.dart';

class DeliveryFormThree extends StatelessWidget {
  final TextEditingController pickupDate;
  final TextEditingController pickupTime;
  final TextEditingController deliveryTime;
  final VoidCallback onPickUpTab;
  final VoidCallback onPickUpTimeTab;
  final VoidCallback onDeliveryTimeTab;
  final VoidCallback onPre;
  final VoidCallback onNext;

  const DeliveryFormThree({
    Key? key,
    required this.pickupDate,
    required this.pickupTime,
    required this.deliveryTime,
    required this.onPickUpTab,
    required this.onPickUpTimeTab,
    required this.onDeliveryTimeTab,
    required this.onPre,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: values.BASE_PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Schedule Pickup',
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            CustomInput(
              controller: pickupDate,
              hint: 'Pickup Date',
              enabled: false,
              onTab: onPickUpTab,
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: pickupTime,
              hint: 'Pickup Time',
              enabled: false,
              onTab: onPickUpTimeTab,
            ),
            SizedBox(height: values.BASE_PADDING * 2),
            Text(
              'Schedule Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            CustomInput(
              controller: deliveryTime,
              hint: 'Delivery Time',
              enabled: false,
              onTab: onDeliveryTimeTab,
            ),
            SizedBox(height: values.BASE_PADDING),
            Row(
              children: [
                TextButton(
                  onPressed: onPre,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.chevron_left,
                        color: colors.TEXT_WHITE,
                        size: values.BUTTON_TEXT,
                      ),
                      Text(
                        '  Prev ',
                        style: TextStyle(
                          color: colors.TEXT_WHITE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.YELLOW,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: onNext,
                  child: Row(
                    children: [
                      Text(
                        ' Next  ',
                        style: TextStyle(
                          color: colors.TEXT_WHITE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: colors.TEXT_WHITE,
                        size: values.BUTTON_TEXT,
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.BUTTON_BLUE,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
