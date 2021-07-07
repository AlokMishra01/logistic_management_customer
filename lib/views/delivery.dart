import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/header.dart';
import 'delivery_form.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(title: 'Delivery'),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Text(
                    'You can request for the pickup / delivery and schedule '
                    'time as per your preference for pickup / delivery',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_SECONDARY,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: values.BASE_PADDING),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING,
                    ),
                    child: Image.asset(
                      'images/time_clock.jpg',
                      width: size.width / 2.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: values.BASE_PADDING),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colors.FIELD_BACKGROUND,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: colors.TEXT_WHITE,
                          primary: colors.BUTTON_BLUE,
                          side: BorderSide(
                            color: colors.BUTTON_BLUE,
                            width: 2,
                          ),
                          textStyle: TextStyle(
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(' Steps '),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: values.BASE_PADDING),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Text(
                    'You are few steps away from delevering your package.',
                    style: TextStyle(
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_SECONDARY,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: values.BASE_PADDING),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: values.BASE_PADDING),
                          CircleAvatar(
                            backgroundColor: colors.PURPLE_LIGHT,
                            radius: 18,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: colors.TEXT_WHITE,
                                fontWeight: FontWeight.w600,
                                fontSize: values.TITLE_TEXT,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: values.BASE_PADDING,
                              ),
                              child: Text(
                                'Sender Information',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: values.TITLE_TEXT,
                                  color: colors.PURPLE_LIGHT,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: values.BASE_PADDING),
                      Row(
                        children: [
                          SizedBox(width: values.BASE_PADDING),
                          CircleAvatar(
                            backgroundColor: colors.PURPLE_LIGHT,
                            radius: 18,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: colors.TEXT_WHITE,
                                fontWeight: FontWeight.w600,
                                fontSize: values.TITLE_TEXT,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: values.BASE_PADDING,
                              ),
                              child: Text(
                                'Package information',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: values.TITLE_TEXT,
                                  color: colors.PURPLE_LIGHT,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: values.BASE_PADDING),
                      Row(
                        children: [
                          SizedBox(width: values.BASE_PADDING),
                          CircleAvatar(
                            backgroundColor: colors.PURPLE_LIGHT,
                            radius: 18,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: colors.TEXT_WHITE,
                                fontWeight: FontWeight.w600,
                                fontSize: values.TITLE_TEXT,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: values.BASE_PADDING,
                              ),
                              child: Text(
                                'Schedule Pickup / Delivery',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: values.TITLE_TEXT,
                                  color: colors.PURPLE_LIGHT,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: values.BASE_PADDING),
                      Row(
                        children: [
                          SizedBox(width: values.BASE_PADDING),
                          CircleAvatar(
                            backgroundColor: colors.PURPLE_LIGHT,
                            radius: 18,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: colors.TEXT_WHITE,
                                fontWeight: FontWeight.w600,
                                fontSize: values.TITLE_TEXT,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: values.BASE_PADDING,
                              ),
                              child: Text(
                                'Receiver Information',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: values.TITLE_TEXT,
                                  color: colors.PURPLE_LIGHT,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: values.BASE_PADDING),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(values.BASE_PADDING),
                  child: CustomButton(
                    title: 'REQUEST NOW',
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (cxt) => DeliveryForm(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
