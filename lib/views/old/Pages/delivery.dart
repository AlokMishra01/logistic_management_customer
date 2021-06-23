import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/delivery_input.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  var name_controler = new TextEditingController();
  var mob_controller = new TextEditingController();
  var add_controller = new TextEditingController();
  var size_controller = new TextEditingController();
  var wt_controller = new TextEditingController();
  var time_controller = new TextEditingController();
  var date_controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 33),
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery",
                style: TextStyle(color: Constant.theme_col, fontSize: 15),
              ),
              Container(
                width: 96,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constant.grey2),
                child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Submit",
                        style:
                            TextStyle(fontSize: 12, color: Constant.theme_col),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 12,
                        color: Constant.theme_col,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 15),
          width: 342,
          child: RichText(
            text: TextSpan(
                text:
                    "Please fill up the form to request for pickup  or \ndelivery.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Constant.text2)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 15),
          child: Text(
            "Consignee/Reciever Detail",
            style: TextStyle(
                color: Constant.theme_col,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constant.grey01,
            ),
            child: DeliveryInput(
              hint: "Name",
              controller: name_controler,
            )),
        Container(
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constant.grey01,
            ),
            child: DeliveryInput(
              hint: "Mobile Number",
              controller: mob_controller,
            )),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 13),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 48,
                color: Constant.grey01,
                child: DeliveryInput(
                  hint: "Address",
                  controller: add_controller,
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: Constant.grey01,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Constant.grey2,
                        width: 1,
                        style: BorderStyle.solid)),
                child: IconButton(
                  icon: Icon(
                    CommunityMaterialIcons.map_outline,
                    color: Constant.green,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 13),
          child: Text(
            "Package Detail",
            style: TextStyle(
                color: Constant.theme_col,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  color: Constant.grey01,
                  child: DeliveryInput(
                    hint: "Size",
                    controller: size_controller,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  color: Constant.grey01,
                  child: DeliveryInput(
                    hint: "Weight",
                    controller: wt_controller,
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 13),
          child: Text(
            "Schedule Detail",
            style: TextStyle(
                color: Constant.theme_col,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  color: Constant.grey01,
                  child: DeliveryInput(
                    hint: "Time",
                    controller: time_controller,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 48,
                  color: Constant.grey01,
                  child: DeliveryInput(
                    hint: "Date",
                    controller: date_controller,
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.only(left: 21, right: 21, top: 13),
          child: Text(
            "Consignor/Shipper Detail",
            style: TextStyle(
                color: Constant.theme_col,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constant.grey01,
              border: Border.all(
                  color: Constant.grey2, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Rajendra Prajapati",
              style: TextStyle(fontSize: 16),
            )),
        Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constant.grey01,
              border: Border.all(
                  color: Constant.grey2, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "98676767",
              style: TextStyle(fontSize: 16),
            )),
        Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(left: 21, right: 21, top: 13),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constant.grey01,
              border: Border.all(
                  color: Constant.grey2, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Bhaktapur",
              style: TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}
