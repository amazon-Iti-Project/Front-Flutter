import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/widgets/appbar.dart';

import 'customer/payment/trasaction_screen.dart';

class YourAccountScreen extends StatefulWidget {
  YourAccountScreen({Key key}) : super(key: key);

  @override
  _YourAccountScreenState createState() => _YourAccountScreenState();
}

class _YourAccountScreenState extends State<YourAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Container(
            width: 100,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset('Images/amazon-black.png'),
            )),
        actions: [
          IconButton(
              icon: Icon(Icons.keyboard_voice_outlined,
                  color: Colors.black, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black, size: 28),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen()));
              }),
        ],
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(133, 217, 225, 1),
                Color.fromRGBO(165, 230, 206, 1)
              ])),
        ),
      ),
      body: SafeArea(
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                child: Text(
                  AppLocalizations.of(context).translate('personalc'),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFf1c65d)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('profile'),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('youraddress'),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                child: Text(
                  AppLocalizations.of(context).translate('payment'),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFf1c65d)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TrasactionScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('yourtransaction'),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('shopwithpoint'),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('productc'),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
