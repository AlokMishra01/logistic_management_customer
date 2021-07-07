import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import 'delivery_form_step_clip.dart';

class DeliveryFormStep extends StatelessWidget {
  final int position;

  const DeliveryFormStep({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: values.BASE_PADDING,
        vertical: values.BASE_PADDING * 2,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: (size.width - (values.BASE_PADDING * 2)) / 6,
            width: double.infinity,
          ),
          ClipPath(
            clipper: DeliveryFormStepClipStart(),
            child: Container(
              width: (size.width - (values.BASE_PADDING * 2)) / 5,
              height: (size.width - (values.BASE_PADDING * 2)) / 6,
              color:
                  position >= 0 ? colors.BUTTON_BLUE : colors.FIELD_BACKGROUND,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: ((size.width - (values.BASE_PADDING * 2)) / 5) *
                          0.25),
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.TEXT_WHITE,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: (((size.width - (values.BASE_PADDING * 2)) / 5) * 0.75) +
                (values.BASE_PADDING / 2),
            child: ClipPath(
              clipper: DeliveryFormStepClipOther(),
              child: Container(
                width: (size.width - (values.BASE_PADDING * 2)) / 5,
                height: (size.width - (values.BASE_PADDING * 2)) / 6,
                color: position >= 1
                    ? colors.BUTTON_BLUE
                    : colors.FIELD_BACKGROUND,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.TEXT_WHITE,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: (((size.width - (values.BASE_PADDING * 2)) / 5) * 0.75) * 2 +
                (values.BASE_PADDING / 2) * 2,
            child: ClipPath(
              clipper: DeliveryFormStepClipOther(),
              child: Container(
                width: (size.width - (values.BASE_PADDING * 2)) / 5,
                height: (size.width - (values.BASE_PADDING * 2)) / 6,
                color: position >= 2
                    ? colors.BUTTON_BLUE
                    : colors.FIELD_BACKGROUND,
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.TEXT_WHITE,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: (((size.width - (values.BASE_PADDING * 2)) / 5) * 0.75) * 3 +
                (values.BASE_PADDING / 2) * 3,
            child: ClipPath(
              clipper: DeliveryFormStepClipOther(),
              child: Container(
                width: (size.width - (values.BASE_PADDING * 2)) / 5,
                height: (size.width - (values.BASE_PADDING * 2)) / 6,
                color: position >= 3
                    ? colors.BUTTON_BLUE
                    : colors.FIELD_BACKGROUND,
                child: Center(
                  child: Text(
                    '4',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.TEXT_WHITE,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
