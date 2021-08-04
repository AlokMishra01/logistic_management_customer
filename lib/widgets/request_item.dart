import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/request_model.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class RequestItem extends StatelessWidget {
  final bool approved;
  final RequestModel request;

  const RequestItem({
    Key? key,
    this.approved = false,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(values.BASE_PADDING),
      decoration: BoxDecoration(
        color: colors.FIELD_BACKGROUND,
        borderRadius: BorderRadius.circular(values.RADIUS),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Reciever Name :  ",
              style: TextStyle(
                fontSize: values.DETAILS_TEXT,
                fontWeight: FontWeight.w500,
                color: colors.TEXT_SECONDARY,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "${request.recieverName}",
                  style: TextStyle(
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w600,
                    color: colors.TEXT_BLACK,
                    height: 1.5,
                  ),
                )
              ],
            ),
            softWrap: true,
          ),
          RichText(
            text: TextSpan(
              text: "Address :  ",
              style: TextStyle(
                fontSize: values.DETAILS_TEXT,
                fontWeight: FontWeight.w500,
                color: colors.TEXT_SECONDARY,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "${request.recieverAddress}",
                  style: TextStyle(
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w600,
                    color: colors.TEXT_BLACK,
                    height: 1.5,
                  ),
                )
              ],
            ),
            softWrap: true,
          ),
          RichText(
            text: TextSpan(
              text: "Current Status :  ",
              style: TextStyle(
                fontSize: values.DETAILS_TEXT,
                fontWeight: FontWeight.w500,
                color: colors.TEXT_SECONDARY,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: approved ? 'Approved' : 'Pending',
                  style: TextStyle(
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w600,
                    color: colors.BUTTON_GREEN,
                    height: 1.5,
                  ),
                )
              ],
            ),
            softWrap: true,
          ),
          if (approved)
            RichText(
              text: TextSpan(
                text: "Price :  ",
                style: TextStyle(
                  fontSize: values.DETAILS_TEXT,
                  fontWeight: FontWeight.w500,
                  color: colors.TEXT_SECONDARY,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "", // TODO: add price
                    style: TextStyle(
                      fontSize: values.DETAILS_TEXT,
                      fontWeight: FontWeight.w600,
                      color: colors.TEXT_BLACK,
                      height: 1.5,
                    ),
                  )
                ],
              ),
              softWrap: true,
            ),
        ],
      ),
    );
  }
}
