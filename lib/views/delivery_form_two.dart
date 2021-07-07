import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_input.dart';

class DeliveryFormTwo extends StatelessWidget {
  final TextEditingController type;
  final TextEditingController description;
  final TextEditingController height;
  final TextEditingController length;
  final TextEditingController width;
  final TextEditingController weight;
  final VoidCallback onPre;
  final VoidCallback onNext;

  const DeliveryFormTwo({
    Key? key,
    required this.type,
    required this.description,
    required this.height,
    required this.length,
    required this.width,
    required this.weight,
    required this.onPre,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              'Package Information',
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            CustomInput(
              controller: type,
              hint: 'Type of Package',
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: description,
              hint: 'Package Description',
            ),
            SizedBox(height: values.BASE_PADDING * 2),
            Text(
              'Size of package',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: values.BASE_PADDING),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    controller: height,
                    hint: 'Height',
                  ),
                ),
                Text(
                  ' X ',
                  style: TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    controller: length,
                    hint: 'Length',
                  ),
                ),
                Text(
                  ' X ',
                  style: TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    controller: width,
                    hint: 'Width',
                  ),
                ),
              ],
            ),
            SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              controller: weight,
              hint: 'Weight',
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
                        '  Next ',
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
