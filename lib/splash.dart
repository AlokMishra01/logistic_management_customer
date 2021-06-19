import 'package:flutter/material.dart';

import 'constants/colors.dart' as colors;

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.BUTTON_BLUE,
    );
  }
}
