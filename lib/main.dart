import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:first_app/screens/WelcomePage.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/screens/TankListEmp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getToken(); // Call getToken function when the app starts
  runApp(MyApp());
}

void getToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print('FCM Token: $token');
}

class MyApp extends StatelessWidget {
  static Locale? _locale;

  static void setLocale(BuildContext context, Locale locale) {
    _locale = locale;
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: _locale ?? Locale('en'), // Set initial locale to English
      fallbackLocale: Locale('en'), // Set fallback locale to English
      title: 'Suqia',
      localizationsDelegates: [
        // Add more localization delegates as needed
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        // Define supported locales
        Locale('en'),
        Locale('ar'), // Remove 'ar' locale if not fully supported
      ],
      home: WelcomePage(),
    );
  }
}