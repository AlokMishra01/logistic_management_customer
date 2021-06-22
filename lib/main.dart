import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistic_management_customer/providers/authentication.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart' as colors;
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
        ProxyProvider<NetworkConnection, AuthenticationProvider>(
          update: (_, authentication, __) => AuthenticationProvider(
            authentication,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Logistic Management Customer',
        theme: ThemeData(
          primarySwatch: generateMaterialColor(color: colors.BUTTON_BLUE),
          textTheme: GoogleFonts.comfortaaTextTheme(),
        ),
        home: Splash(),
      ),
    );
  }
}
