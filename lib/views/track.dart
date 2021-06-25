import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/track_product.dart';
import '../widgets/header.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(title: 'Track'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Text(
              'You can now track your package live just '
              'enter the Airway bill number and proceed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.TEXT_BLACK,
                fontSize: values.DETAILS_TEXT - 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(values.BASE_PADDING),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter your Tracking Number",
                hintStyle: TextStyle(
                  color: colors.TEXT_SECONDARY,
                  fontSize: values.TITLE_TEXT,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: colors.TEXT_SECONDARY,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: colors.TEXT_SECONDARY,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                focusColor: colors.FIELD_BACKGROUND,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: colors.TEXT_SECONDARY,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.TEXT_BLACK,
                fontSize: values.TITLE_TEXT,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Text(
              "Track up to 10 numbers at a time. Separate by a comma (,) ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.TEXT_BLACK,
                fontSize: values.DETAILS_TEXT - 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: values.BASE_PADDING),
          TextButton(
            onPressed: () {},
            child: Text(
              ' NEXT ',
              style: TextStyle(
                fontSize: values.BUTTON_TEXT,
                color: colors.TEXT_WHITE,
                height: 1.25,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: colors.BUTTON_GREEN,
              padding: const EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING * 2,
                vertical: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(values.RADIUS / 2),
              ),
            ),
          ),
          Divider(
            height: values.BASE_PADDING * 4,
            thickness: 3,
            color: colors.FIELD_BACKGROUND,
          ),
          Container(
            height: values.HEADER_TEXT + 8,
            margin: EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
            decoration: BoxDecoration(
              color: colors.FIELD_BACKGROUND,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: colors.TEXT_SECONDARY_LIGHT,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      val = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: values.HEADER_TEXT + 8,
                      decoration: BoxDecoration(
                        color:
                            val == 0 ? colors.TEXT_WHITE : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.bold,
                            color: (val == 0)
                                ? colors.TEXT_BLUE
                                : colors.TEXT_SECONDARY,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      val = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: values.HEADER_TEXT + 8,
                      decoration: BoxDecoration(
                        color:
                            val == 1 ? colors.TEXT_WHITE : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.bold,
                            color: (val == 1)
                                ? colors.TEXT_BLUE
                                : colors.TEXT_SECONDARY,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(values.BASE_PADDING),
            margin: EdgeInsets.all(values.BASE_PADDING),
            decoration: BoxDecoration(
              color: colors.FIELD_BACKGROUND,
              borderRadius: BorderRadius.circular(values.RADIUS),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Rs 500",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: values.DETAILS_TEXT,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
                        text: "Raj Kumar Thapa",
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
                        text: "Bhaktapur",
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
                        text: "At Kathmandu WareHouse",
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
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TrackProduct(),
                          ),
                        );
                      },
                      child: Text(
                        '  Track Product  ',
                        style: TextStyle(
                          fontSize: values.BUTTON_TEXT - 2,
                          color: colors.TEXT_WHITE,
                          height: 1.25,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: colors.BUTTON_GREEN,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            values.RADIUS / 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
