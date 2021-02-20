import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/applocalization.dart';
import 'package:project/homepage.dart';

class TrasnactionScreen extends StatefulWidget {
  TrasnactionScreen({Key key}) : super(key: key);

  @override
  _TrasnactionScreenState createState() => _TrasnactionScreenState();
}

class _TrasnactionScreenState extends State<TrasnactionScreen> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon"),
      ),
      body: SafeArea(
        child: ListView(children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Your Payments",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.grey,
                height: 1,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Transaction",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf1c65d),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFf1c65d)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Date :",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("12/5/2020"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Transactional Type :",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("12/5/2020"),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Order Price :",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text("12/5/2020"),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Delivered Date:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text("12/5/2020"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Shipment Fees:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text("12/5/2020"),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Total Trasactional:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text("300 LE"),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
