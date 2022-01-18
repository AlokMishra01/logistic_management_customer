import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart' as colors;
import 'controllers/authentication_controller.dart';
import 'controllers/connectivity_controller.dart';
import 'controllers/dio_controller.dart';
import 'controllers/geo_locator_controller.dart';
import 'controllers/message_controller.dart';
import 'controllers/notification_controller.dart';
import 'controllers/package_controller.dart';
import 'controllers/profile_controller.dart';
import 'providers/blog_provider.dart';
import 'services/preference_service.dart';
import 'views/login.dart';
import 'views/main_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    context.read<ConnectivityController>();
    context.read<GeoLocatorController>();
    context.read<DioController>();
    context.read<AuthenticationController>();
    context.read<ProfileController>();
    context.read<PackageController>();
    context.read<BlogProvider>();
    context.read<MessageController>();
    context.read<NotificationController>();
    _checkLogin();
  }

  _checkLogin() {
    Timer(const Duration(seconds: 5), () async {
      if (await PreferenceService.service.isLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (cxt) => const MainPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (cxt) => const Login()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colors.TEXT_WHITE,
    );
  }
}
