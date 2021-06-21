import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/widgets/old/Widgets/singleBlogCard.dart';

import '../../../constant.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 21, top: 33),
          child: Text(
            "Home",
            style: TextStyle(color: Constant.theme_col, fontSize: 24),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 21, vertical: 16),
          child: Text(
            "Good Morning, Ramesh Regmi",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21),
          child: Image.asset(
            "images/banner1.png",
            fit: BoxFit.fill,
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: 164,
        ),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 22),
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Blog/News",
                style: TextStyle(color: Constant.theme_col, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('view_all');
                },
                child: Container(
                  width: 70,
                  height: 24,
                  padding: EdgeInsets.only(left: 5, top: 2.3),
                  decoration: BoxDecoration(
                      color: Constant.grey1,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Constant.grey2,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text("View All",
                        style: TextStyle(
                            color: Constant.theme_col,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              )
            ],
          ),
        ),
        SingleBlogCard(),
        SingleBlogCard(),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 21, right: 21, top: 15),
          height: 60,
          decoration: BoxDecoration(
              color: Constant.theme_col,
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(left: 14, right: 26),
                width: 220,
                child: RichText(
                  text: TextSpan(
                      text:
                          "Be our prime minister and get one day delivery service and more",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 14),
                width: 70,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: FlatButton(
                  onPressed: () {},
                  minWidth: 60,
                  height: 24,
                  child: RichText(
                    text: TextSpan(
                      text: "Buy now",
                      style: TextStyle(
                          color: Constant.theme_col,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
