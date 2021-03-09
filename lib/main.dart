import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/localizationService.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'models/product-model.dart';
import 'screens/customer/home/homepage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findRootAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  _MyAppState();

  void setLocale(Locale locale) {
    initLange();
  }

  @override
  void initState() {
    super.initState();

    initLange();

    // LocalizationService().getLanguage().then((res) => print("langMain:$res"));
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

  void initLange() async {
    LocalizationService serv = await LocalizationService();
    await serv.getLanguage();
    setState(() {
      String lang = serv.lang;
      _locale = lang == 'ar' ? Locale('ar', 'ME') : Locale('en', 'US');
    });
  }

  @override
  Widget build(BuildContext context) {
    // var splashScreenView = SplashScreenView(
    //     // home: TrasnactionScreen(),
    //     // home:SellerAddProduct(),
    //     // home: Category(),
    //     home:MyHomePage() ,
    //     // home: NewAddress(),
    //     duration: 3000,
    //     imageSize: 100,
    //     imageSrc: "Images/logo.png",
    //     text: "Amazon",
    //     textType: TextType.TyperAnimatedText,
    //     textStyle: TextStyle(
    //       fontSize: 30.0,
    //     ),
    //     backgroundColor: Colors.white,
    //   );
    return MaterialApp(
      title: "ITI-Amazon",
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: LocalizationService().supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       home: SplashScreenView(
        // home: SellerHomeScreen(),
        home: MyHomePage(),
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
