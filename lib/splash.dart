import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logistic_management_customer/providers/authentication.dart';
import 'package:logistic_management_customer/views/old/Pages/home.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart' as colors;
import 'services/connectivity/network_connection.dart';
import 'views/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkConnection>().hasInternet;
    context.read<AuthenticationProvider>();
    Timer(Duration(seconds: 2), () {
      if (context.read<AuthenticationProvider>().isLoggedIn)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (cxt) => Home()),
        );
      else
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (cxt) => Login()),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.TEXT_WHITE,
    );
  }
}
