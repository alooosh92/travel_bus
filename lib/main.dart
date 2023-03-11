import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/screen/login_screen.dart';
import 'firebase_options.dart';
import 'res/localizations_manager.dart';
import 'res/routes_manager.dart';
import 'res/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //Routes
      routes: allRoutes,
      //Local
      translations: AllLocalizationsManager.translations,
      locale: AllLocalizationsManager.locale,
      fallbackLocale: AllLocalizationsManager.fallbackLocale,
      defaultTransition: AllLocalizationsManager.defaultTransition,
      localizationsDelegates: AllLocalizationsManager.localizationsDelegates,
      supportedLocales: AllLocalizationsManager.supportedLocales,
      //Theme
      theme: AllThemeManager.themeData,
      //Home
      home: const LoginScreen(),
    );
  }
}
