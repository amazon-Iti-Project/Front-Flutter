import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/screens/customer/home/homeScreen.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/screens/seller/addProduct/addProduct.dart';
import 'package:project/screens/seller/seller-home-screen.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'models/product.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';


void main() async {
  runApp(MyApp());
}





class MyApp extends StatefulWidget {
  
  MyApp({Key key, }) : super(key: key);
  

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findRootAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Future<List<Product>> products;

  _MyAppState({this.products});
  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
    void initState() {
     
      super.initState();
    //    getProducts()
    //     .then((res) => {
    //    this.products ==res,
    //    print("myList by kamal"),
    //    print(this.products),
    //    setState(() { })
    //   //  print(myList.toString())
    //    } ) 
    //  .catchError((err)=>print(err));
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Iti-amazon",
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
            // return supportedLocale;
            return Locale('ar', 'ME');
            // return Locale('en', 'US');
          }
        }
            return supportedLocales.toList()[0];
      },
      home: SplashScreenView(
        home: SellerHomeScreen(),
        // home:MyHomePage(),
        // home: Category(),
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