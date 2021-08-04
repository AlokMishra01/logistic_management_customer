import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistic_management_customer/providers/delivery_provider.dart';
import 'package:logistic_management_customer/providers/request_provider.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart' as colors;
import 'providers/about_us_provider.dart';
import 'providers/authentication.dart';
import 'providers/blog_provider.dart';
import 'services/connectivity/network_connection.dart';
import 'splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<NetworkConnection>(
          create: (_) => NetworkConnection(),
        ),
        ListenableProxyProvider<NetworkConnection, AuthenticationProvider>(
          update: (_, n, __) => AuthenticationProvider(n),
        ),
        ListenableProxyProvider<NetworkConnection, DeliveryProvider>(
          update: (_, n, __) => DeliveryProvider(n),
        ),
        ListenableProxyProvider<NetworkConnection, BlogProvider>(
          update: (_, n, __) => BlogProvider(n),
        ),
        ListenableProxyProvider<NetworkConnection, RequestProvider>(
          update: (_, n, __) => RequestProvider(n),
        ),
        ListenableProxyProvider<NetworkConnection, AboutUsProvider>(
          update: (_, n, __) => AboutUsProvider(n),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Logistic Management Customer',
        theme: ThemeData(
          primarySwatch: generateMaterialColor(color: colors.BUTTON_BLUE),
          textTheme: GoogleFonts.comfortaaTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Splash(),
      ),
    );
  }
}
