import 'package:flutter/material.dart';
import 'package:logistic_management_customer/widgets/old/Widgets/customButton.dart';
import 'package:logistic_management_customer/widgets/old/Widgets/custominput.dart';

import '../../../constant.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var name = new TextEditingController();
  var number = new TextEditingController();
  var email = new TextEditingController();
  var address = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 36),
              width: MediaQuery.of(context).size.width * 0.96,
              child: Text(
                "Register",
                style: TextStyle(color: Constant.theme_col, fontSize: 36),
              ),
            ),
            CustomInput(hint: "Name", controller: name),
            CustomInput(hint: "Address", controller: address),
            CustomInput(hint: "Mobile Number", controller: number),
            CustomInput(hint: "Email", controller: email),
            CustomButton(
              title: "Confirm",
              pressed: () {
                print(name.text.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
