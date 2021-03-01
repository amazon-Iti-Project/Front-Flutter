import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/seller/payment/seller-payments.dart';

class SellerPaymentHome extends StatefulWidget {
  @override
  SellerPaymentHomeState createState() => SellerPaymentHomeState();
}

class SellerPaymentHomeState extends State<SellerPaymentHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: const Text('Orders'),
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
                      text: "Wallet",
                    ),
                    Tab(
                      // child: AppText(
                      //   "Delivered",
                      //   color: Colors.white,
                      // ),
                      text: "Delivered",

                    ),
                  ],
                ),
              ),
              body: TabBarView(children: [
                SellerPayments(),
                SellerPayments(),
              ]))
          //  AppLocalizations.of(context).translate('shopbydep')
          ),
    );
  }
}
