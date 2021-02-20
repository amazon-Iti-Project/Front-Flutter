import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/applocalization.dart';
import 'package:project/homepage.dart';
import 'package:project/screens/product_detalis_screen.dart';
import 'package:project/screens/trasaction_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findRootAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'ME'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
      },
      home: SplashScreenView(
        home: TrasnactionScreen(),
        duration: 3000,
        imageSize: 100,
        imageSrc: "Images/logo.png",
        text: "Amazon",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
