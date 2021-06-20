import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart' as colors;
import 'services/connectivity/network_connection.dart';
import 'services/storage/preference_service.dart';
import 'splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<NetworkConnection>(
            create: (_) => NetworkConnection()),
        Provider<PreferenceService>(create: (_) => PreferenceService()),
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
