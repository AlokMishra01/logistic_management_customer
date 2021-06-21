import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomInput extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  bool pass = false;
  CustomInput({this.hint, this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constant.grey1,
      margin: EdgeInsets.only(left: 16, right: 16, top: 36),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 52,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          focusColor: Constant.grey1,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
        ),
        controller: controller,
        obscureText: (hint == "password") ? true : false,
      ),
    );
  }
}
