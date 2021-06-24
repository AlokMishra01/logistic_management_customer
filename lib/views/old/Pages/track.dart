import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/old/Pages/trackyourproduct.dart';

import '../../../constant.dart';

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
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 21, right: 21, top: 33),
            child: Text(
              "Track",
              style: TextStyle(fontSize: 24, color: Constant.theme_col),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 34, right: 34, top: 40),
            width: MediaQuery.of(context).size.width,
            child: RichText(
              text: TextSpan(
                text:
                    "You can now track your package live just enter the Airway bill number and proceed. ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                ),
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 34, right: 34, top: 34),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: Constant.grey01,
                border: Border.all(
                    color: Constant.grey2, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(6)),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                hintText: "Enter your Tracking Number",
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constant.grey2,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constant.grey2,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                focusColor: Constant.grey01,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constant.grey2,
                      width: 1,
                      style: BorderStyle.solid),
                ),
              ),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 34, right: 34, top: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Track up to 10 numbers at a time. Separate by a comma (,) ",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            width: 121,
            height: 36,
            decoration: BoxDecoration(
                color: Constant.green, borderRadius: BorderRadius.circular(6)),
            child: FlatButton(
              onPressed: () {},
              child: Center(
                  child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Divider(
            height: 80,
            thickness: 3,
            color: Constant.grey1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            width: MediaQuery.of(context).size.width,
            height: 44,
            decoration: BoxDecoration(
                color: Constant.grey01,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: Constant.grey2, width: 1, style: BorderStyle.solid)),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 0;
                    });
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 70) / 2,
                    height: 44,
                    decoration: BoxDecoration(
                        color: (val == 0) ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "Pending",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: (val == 0)
                                ? Constant.theme_col
                                : Constant.unselected),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      val = 1;
                    });
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 70) / 2,
                    height: 45,
                    decoration: BoxDecoration(
                        color: (val == 1) ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: (val == 1)
                                ? Constant.theme_col
                                : Constant.unselected),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20, left: 34, right: 34),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Constant.grey1, borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "Rs 500",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Reciever Name: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Raj Kumar Thapa",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        )
                      ]),
                  softWrap: true,
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                      text: "Address ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Bhaktapur",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        )
                      ]),
                  softWrap: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Current Status ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "At Kathmandu WareHouse",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Constant.green,
                                ),
                              )
                            ]),
                        softWrap: true,
                      ),
                    ]),
                SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Constant.green,
                            borderRadius: BorderRadius.circular(6)),
                        child: FlatButton(
                          child: Text(
                            "Track Product",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            softWrap: true,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Trackyourproduct(),
                              ),
                            );
                          },
                        ),
                      )
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
