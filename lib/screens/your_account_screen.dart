import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: ListView(children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmazonAppBar(),
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
