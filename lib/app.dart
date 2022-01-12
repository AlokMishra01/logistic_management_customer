import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistic_management_customer/controllers/notification_controller.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/connectivity_controller.dart';
import 'controllers/dio_controller.dart';
import 'controllers/profile_controller.dart';
import 'splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cxt) => ConnectivityController(),
        ),
        ChangeNotifierProvider(
          create: (cxt) => DioController(cxt),
        ),
        ChangeNotifierProxyProvider2<ConnectivityController, DioController,
            AuthenticationController>(
          create: (cxt) => AuthenticationController(null, null),
          update: (cxt, conn, dio, auth) => AuthenticationController(conn, dio),
        ),
        ChangeNotifierProxyProvider3<ConnectivityController,
            AuthenticationController, DioController, PackageController>(
          create: (cxt) => PackageController(null, null, null),
          update: (cxt, conn, auth, dio, pack) => PackageController(
            conn,
            auth,
            dio,
          ),
        ),
        ChangeNotifierProxyProvider3<ConnectivityController,
            AuthenticationController, DioController, ProfileController>(
          create: (cxt) => ProfileController(null, null, null),
          update: (cxt, conn, auth, dio, profile) => ProfileController(
            conn,
            auth,
            dio,
          ),
        ),
        ChangeNotifierProxyProvider3<ConnectivityController,
            AuthenticationController, DioController, NotificationController>(
          create: (cxt) => NotificationController(null, null, null),
          update: (cxt, conn, auth, dio, n) => NotificationController(
            conn,
            auth,
            dio,
          ),
        ),
      ],

      // Todo: use go router
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Logistic Management Customer',
        theme: ThemeData(
          primarySwatch: generateMaterialColor(color: BUTTON_BLUE),
          textTheme: GoogleFonts.comfortaaTextTheme(),
        ),
        // home: Splash(),
        home: const Splash(),
      ),
    );
  }
}
