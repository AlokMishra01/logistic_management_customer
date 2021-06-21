import 'package:flutter/material.dart';

import '../../../constant.dart';

class DeliveryInput extends StatelessWidget {
  String? hint;
  TextEditingController? controller;
  DeliveryInput({this.hint, this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Constant.grey2, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Constant.grey2, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8)),
        focusColor: Constant.grey01,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Constant.grey2, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8)),
      ),
      controller: controller,
    );
  }
}
