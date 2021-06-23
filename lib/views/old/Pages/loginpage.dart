import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/customButton.dart';
import '../../../widgets/old/Widgets/custominput.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void print1(BuildContext context) {
    print("Login");
    Navigator.of(context).pushNamed('home');
  }

  void print2(BuildContext context) {
    print("Register");
    Navigator.of(context).pushNamed('register');

    // Navigator.of(context).pushNamed();
  }

  var num_text = new TextEditingController();
  var pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 21),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 36,
                  color: Constant.theme_col,
                ),
              ),
            ),
            CustomInput(hint: "9841650403", controller: num_text),
            CustomInput(hint: "password", controller: pass),
            Container(
              margin: EdgeInsets.only(right: 16, top: 16),
              width: MediaQuery.of(context).size.width * 0.96,
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Constant.theme_col, fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
            CustomButton(title: 'Login', pressed: () => print1(context)),
            CustomButton(
              title: "Register",
              pressed: () => print2(context),
            )
          ],
        ),
      ),
    );
  }
}
