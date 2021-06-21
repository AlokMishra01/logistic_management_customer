import 'package:flutter/material.dart';

class Constant{

  static Color theme_col=_colorFromHex("#46699E");
  static Color grey1=_colorFromHex("#EFEEEE");
  static Color green=_colorFromHex("#0D9E1C");
  static Color text1=_colorFromHex("#706D6D");
  static Color grey2=_colorFromHex("#E7E5E5");
  static Color text2=_colorFromHex("#5A5656");
  static Color grey01=_colorFromHex("#F6F6F6");
  static Color unselected=_colorFromHex("#858383");
  static Color grey=_colorFromHex("#F9F9F9");

  static int index=0;



}


Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}