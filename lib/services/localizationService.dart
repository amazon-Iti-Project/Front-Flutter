
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  final List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'ME'),
  ];
  final Locale defaultLocale = Locale('en', 'US');
  String lang;
  SharedPreferences prefs;
  Function onLangChange;

static final LocalizationService  _localServiceInstance = LocalizationService._internal();

  factory LocalizationService() {
    return _localServiceInstance;
  }

  initOnLanguageChange(Function onLangChange){
    this.onLangChange = onLangChange;
  }

// private constructor
  LocalizationService._internal(){
    getSharedPreferences();
  }


  setLanguage(String lang) async{
      if(prefs == null){
        prefs = await SharedPreferences.getInstance();
      prefs.setString('lang', lang);
      }else
      prefs.setString('lang', lang);
  }

  getSharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
  }

   Future<String> getLanguage() async {
     String storedLang;
           if(prefs == null){
        prefs = await SharedPreferences.getInstance();
            storedLang= prefs.getString('lang');
      }else
            storedLang= prefs.getString('lang');
  
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
    // SharedPreferences.getInstance().then((prefs) { } );
     lang = storedLang != null? storedLang : 'en';
    // print("Sharedlang: $lang");
     return lang;
  }

  Locale getLocale(Locale defLocale,Iterable<Locale> supportedLocales) {
    // print("defLocal:${defLocale}");
    // print("lang:${lang}");
    Locale locale =defLocale; 
    if(lang == 'ar') locale = Locale('ar', 'ME');
    return locale;

    // old approach
    // for (var supportedLocale in supportedLocales) {
    //   if (supportedLocale.languageCode == locale.languageCode &&
    //       supportedLocale.countryCode == locale.countryCode) {
    //     return supportedLocale;
    //     // return Locale('ar', 'ME');
    //     // return Locale('en', 'US');
    //   }
    // }
    // return locale;
  }
}
