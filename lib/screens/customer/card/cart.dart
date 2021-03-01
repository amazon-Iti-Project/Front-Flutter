import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/services/Localization/applocalization.dart';

import 'checkout.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
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
              icon: Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black, size: 28),
              onPressed: () {}),
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
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(padding: const EdgeInsets.only(top: 125.0)),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.network(
                              'https://i01.appmifile.com/webfile/globalimg/in/cms/4BAADF0B-B0D8-D9C3-1D38-43BAB1F76080.jpg'),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Laptop",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              Text("\$59.99",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red[900])),
                              Text(
                                  AppLocalizations.of(context)
                                      .translate('inStock'),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green[700])),
                              Row(
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                              .translate('color') +
                                          ": ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text("black",
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[400]),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text('-'),
                          ),
                        Container(
                          width: 70,
                          height: 35,
                          child: Center(child: Text(_value.toString())),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey[400]),
                            elevation: MaterialStateProperty.all<double>(0.0),
                          ),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text('+'),
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[400]),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text(AppLocalizations.of(context)
                                .translate('delete')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[400]),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text(AppLocalizations.of(context)
                                .translate('saveForLater')),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(AppLocalizations.of(context)
                              .translate('compareSimilarItems')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[300])),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context).translate('subtotal')),
                      Text(" (" +
                          "3" +
                          AppLocalizations.of(context).translate('items') +
                          ") "),
                      Text(
                        "\$ 28.96",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool value) {
                          print('ok');
                        },
                        tristate: true,
                        value: false,
                        activeColor: Colors.cyan[900],
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .translate('orderContainGift'),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CheckoutScreen()));
                      },
                      color: Color.fromRGBO(242, 196, 89, 1),
                      child: Text(AppLocalizations.of(context)
                          .translate('proceedToCheckout')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
