import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/pp.dart';
import 'package:project/screens/customer/cart/newAddress.dart';
import 'package:project/screens/customer/category/category.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'models/product.dart';
import 'package:http/http.dart' as http;

import 'screens/customer/home/homeScreen.dart';
import 'screens/customer/home/homepage.dart';


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
    var splashScreenView = SplashScreenView(
        // home: TrasnactionScreen(),
        // home:SellerAddProduct(),
        // home: Category(),
        home:MyHomePage() ,
        // home: NewAddress(),
        duration: 3000,
        imageSize: 100,
        imageSrc: "Images/logo.png",
        text: "Amazon",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.white,
      );
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
            return locale;

      },
      home: splashScreenView,
    );
  }
}


Future<List<Product>> fetchProducts() async {
  final response = await http.get('http://localhost:3000/products');
  // final response = await http.get('https://api.androidhive.info/json/movies.json');
  

  if (response.statusCode == 200) {
    print("done print");
    return parseProducts(response.body);
  } else {
    print("exception print");
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
 const String BASE_URL = "http://localhost:8000/products";

 Future<List<Product>> getProducts() async {
  Response response;
  Dio dio =  Dio();
  
  response = await dio.get(BASE_URL);
  if (response.statusCode == 200){
  print("response by kamal : ");
  // print(response.data.toString());
  // now data is map objects
  var data = response.data;
    return data.map<Product>((prod){
     return   Product.fromJson(prod);
    }
    ).toList();

  // or may get like that to get by query parameters
  // response =
  //     await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
  // print(response.data.toString());
  }else{
    print("PostService: error in getting data");
  }

}
