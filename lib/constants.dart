import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/services/Localization/applocalization.dart';

const String API_URL = "https://amazon-api-jsonserver.herokuapp.com";
const String categories = "categories";
const String brands = "brands";
const String fees = "fees";
// localization configration 
// if u have 2 material app u should reinit localization configration

 Map<String,dynamic> localConfig =
{
  "debugShowCheckedModeBanner":false,
  "locale":null,
  "supportedLocales":[
        Locale('en', 'US'),
        Locale('ar', 'ME'),
      ],
      "localizationsDelegates": [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      "localeResolutionCallback":(Locale locale,List<Locale> supportedLocales) {
         
        for (var supportedLocale in supportedLocales) {
          
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            // return supportedLocale;
            return Locale('ar', 'ME');
            // return Locale('en', 'US');
          }
        }
            return supportedLocales.toList()[0];
      },

} ;
      // debugShowCheckedModeBanner: localConfig["debugShowCheckedModeBanner"]as bool ,
      // locale: _locale,
      // supportedLocales: localConfig["supportedLocales"] as List<Locale> ,
      // localizationsDelegates: localConfig["localizationsDelegates"] as List<LocalizationsDelegate>,
      // localeResolutionCallback: (localConfig["localeResolutionCallback"]as Function)(_locale,localConfig["supportedLocales"] as List<Locale> ,),



      // supportedLocales: [
      //   Locale('en', 'US'),
      //   Locale('ar', 'ME'),
      // ],
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // localeResolutionCallback: (locale, supportedLocales) {
         
      //   for (var supportedLocale in supportedLocales) {
          
      //     if (supportedLocale.languageCode == locale.languageCode &&
      //         supportedLocale.countryCode == locale.countryCode) {
      //       // return supportedLocale;
      //       return Locale('ar', 'ME');
      //       // return Locale('en', 'US');
      //     }
      //   }
      //       return supportedLocales.toList()[0];
      // },

