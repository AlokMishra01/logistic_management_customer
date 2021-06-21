import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class SingleMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      width: MediaQuery.of(context).size.width * 1,
      color: Constant.grey1,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            CommunityMaterialIcons.message_outline,
            color: Constant.theme_col,
            size: 41,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 153,
                  child: RichText(
                    text: TextSpan(
                        text: "Welcome to our platform.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                Container(
                  width: 225,
                  child: RichText(
                    text: TextSpan(
                        text:
                            "Thank you for signing up in our app. We promise to provide the quality service.",
                        style: TextStyle(fontSize: 9, color: Colors.black38)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
