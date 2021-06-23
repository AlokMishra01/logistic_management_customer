import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/customButton.dart';

class ComposeMessage extends StatefulWidget {
  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  var sub_contoleer = new TextEditingController();
  var mssg_controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Constant.theme_col,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Compose Message",
          style: TextStyle(color: Constant.theme_col, fontSize: 24),
          textAlign: TextAlign.left,
        ),
        titleSpacing: -10,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 25),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "From",
                style: TextStyle(color: Constant.theme_col, fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 32, top: 20),
              height: 54,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 10),
              decoration: BoxDecoration(
                color: Constant.grey,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: Constant.grey1, width: 1, style: BorderStyle.solid),
              ),
              child: Text(
                "Rajendra Prajapati",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 25),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Subject",
                style: TextStyle(color: Constant.theme_col, fontSize: 12),
              ),
            ),
            Container(
                height: 54,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                decoration: BoxDecoration(
                    color: Constant.grey,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Constant.grey1,
                        width: 1,
                        style: BorderStyle.solid)),
                child: TextFormField(
                  controller: sub_contoleer,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    focusColor: Constant.grey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 16, top: 25),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Subject",
                style: TextStyle(color: Constant.theme_col, fontSize: 12),
              ),
            ),
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                decoration: BoxDecoration(
                    color: Constant.grey,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Constant.grey1,
                        width: 1,
                        style: BorderStyle.solid)),
                child: TextFormField(
                  controller: mssg_controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    focusColor: Constant.grey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constant.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  maxLines: 10,
                )),
            CustomButton(
              title: "Send",
              pressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
