import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // try {
  //   AppUpdateInfo info = await InAppUpdate.checkForUpdate();
  //   if (info.updateAvailability == UpdateAvailability.updateAvailable) {
  //     await InAppUpdate.performImmediateUpdate();
  //   }
  // } catch (e, s) {
  //   log('In App Update Error!', error: e, stackTrace: s);
  // }
  runApp(const MyApp());
}
