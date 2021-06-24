import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/old/Pages/singleNotice.dart';

import '../../../constant.dart';

class SingleBlogCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Constant.grey1, borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.only(left: 21, right: 21, top: 18),
        width: MediaQuery.of(context).size.width * 1,
        height: 92,
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          child: Row(
            children: [
              Container(
                child: Image.asset("images/banner2.png"),
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Opening day delivery",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      width: 203,
                      margin: EdgeInsets.only(left: 2),
                      child: RichText(
                        text: TextSpan(
                            text:
                                "Our delivery started from the date of 2nd Jan,2021",
                            style: TextStyle(
                                color: Constant.text1,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                wordSpacing: 0.015)),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SingleNotice()),
            );
          },
        ));
  }
}
