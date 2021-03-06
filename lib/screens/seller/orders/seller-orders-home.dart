import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/seller/orders/pending-orders.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';
import 'deliverd-orders.dart';
import 'package:project/services/Localization/applocalization.dart';


class SellerOrdersHome extends StatefulWidget {
  @override
  SellerOrdersHomeState createState() => SellerOrdersHomeState();
}

class SellerOrdersHomeState extends State<SellerOrdersHome> {
   final String localizedParentData = "SellerOrders";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            return supportedLocales.toList()[0];
      },
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: LocalizedText(localizedParentData,'orders',color: Colors.white,bold:true,),
                // title: Text("asd"),
                backgroundColor: HexColor("#232F3E"),
                
                bottom: TabBar(
                  labelStyle:TextStyle(fontSize: 20,
                  fontFamily: 'AmazonFont',
                  fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle:TextStyle(fontSize: 20,
                  fontFamily: 'AmazonFont',
                  ),
                  labelColor:HexColor("#f08804"),
                  unselectedLabelColor:Colors.white,
                  indicatorColor: HexColor("#f08804"),
                  tabs: [
                    Tab(
                      // child: AppText(
                      //   "Bending",
                      //   color: Colors.white,
                      // ),
                      text: AppLocalizations.of(context).translateNested(localizedParentData,"pending"),
                    
                    ),
                    Tab(
                      // child: AppText(
                      //   "Delivered",
                      //   color: Colors.white,
                      // ),
                      text: AppLocalizations.of(context).translateNested(localizedParentData,"delivered"),
                    ),
                  ],
                ),
              ),
              body: TabBarView(children: [
                SellerPendingOrders(),
                SellerDeliveredOrders(),
              ]))
          //  AppLocalizations.of(context).translate('shopbydep')
          ),
    );
  }
}
