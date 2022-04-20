import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/connectivity_controller.dart';
import 'controllers/dio_controller.dart';
import 'controllers/general_controller.dart';
import 'controllers/geo_locator_controller.dart';
import 'controllers/message_controller.dart';
import 'controllers/notification_controller.dart';
import 'controllers/package_controller.dart';
import 'controllers/profile_controller.dart';
import 'providers/blog_provider.dart';
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
        ChangeNotifierProxyProvider<ConnectivityController,
            GeoLocatorController>(
          create: (cxt) => GeoLocatorController(null),
          update: (cxt, conn, geo) => GeoLocatorController(conn),
        ),
        ChangeNotifierProxyProvider2<ConnectivityController, DioController,
            BlogProvider>(
          create: (cxt) => BlogProvider(null, null),
          update: (cxt, conn, dio, blog) => BlogProvider(conn, dio),
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
            AuthenticationController, DioController, GeneralController>(
          create: (cxt) => GeneralController(null, null, null),
          update: (cxt, conn, auth, dio, pack) => GeneralController(
            conn,
            auth,
            dio,
          ),
        ),
        ChangeNotifierProxyProvider3<ConnectivityController,
            AuthenticationController, DioController, MessageController>(
          create: (cxt) => MessageController(null, null, null),
          update: (cxt, conn, auth, dio, pack) => MessageController(
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
