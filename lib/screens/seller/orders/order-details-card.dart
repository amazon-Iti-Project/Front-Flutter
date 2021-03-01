import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';

class OrderDetailsCard extends StatefulWidget {
  @override
  OrderDetailsCardState createState() => OrderDetailsCardState();
}

class OrderDetailsCardState extends State<OrderDetailsCard> {
  bool isDetailsShown = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: HexColor("#f08804"),
          ),
          borderRadius: BorderRadius.circular(5.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: AppText(
                                  "Order Id",
                                  bold: true,
                                  maxLines: 3,
                                ),
                              ),
                              AppText(
                                "1",
                                bold: true,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              "Order amount",
                              subText: true,
                            ),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      "\$ ",
                                      fontSize: 12,
                                    ),
                                    AppText(
                                      "120 ",
                                      subText: true,
                                      bold: true,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              "Amazon Fee",
                              subText: true,
                            ),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      "\$ ",
                                      fontSize: 12,
                                    ),
                                    AppText(
                                      "120 ",
                                      subText: true,
                                      bold: true,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              "Total Net ",
                              subText: true,
                            ),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      "\$ ",
                                      fontSize: 12,
                                    ),
                                    AppText(
                                      "120 ",
                                      subText: true,
                                      bold: true,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => OrderDetails()));
                                },
                                child: AppText(
                                  "Show Order Details",
                                  subText: true,
                                  color: Colors.cyan[800],
                                )),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        isDetailsShown
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Order date",
                                        subText: true,
                                      ),
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "Nov 25,2019 ",
                                                bold: true,
                                                subText: true,
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Payment Type",
                                        subText: true,
                                      ),
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "Cash on Delivery ",
                                                subText: true,
                                                bold: true,
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Kamal Korney Mohamed",
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "Cairo , 37st elgamaa",
                                        subText: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "01115404643",
                                        subText: true,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "Shipment Details",
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Expected Delivery",
                                        subText: true,
                                      ),
                                      AppText(
                                        "Nov 30,2019",
                                        subText: true,
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Shippment Fee",
                                        subText: true,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "\$ ",
                                            fontSize: 12,
                                          ),
                                          AppText(
                                            "120 ",
                                            subText: true,
                                            bold: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Shippment via",
                                        subText: true,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "seller Name ",
                                            subText: true,
                                            bold: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          isDetailsShown = !isDetailsShown;
                                          setState(() {});
                                        },
                                        child: AppText(
                                          "hide",
                                          color: Colors.cyan[800],
                                          subText: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isDetailsShown = !isDetailsShown;
                                      setState(() {});
                                    },
                                    child: AppText(
                                      "show more",
                                      color: Colors.cyan[800],
                                      subText: true,
                                    ),
                                  ),
                                ],
                              ),
                      ].where((Object o) => o != null).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
