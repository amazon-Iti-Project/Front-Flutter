import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../app-text.dart';

class SellerPaymentDetails extends StatefulWidget {
  @override
  SellerPaymentDetailsState createState() => SellerPaymentDetailsState();
}

class SellerPaymentDetailsState extends State<SellerPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Payment Details'),
          backgroundColor: HexColor("#232F3E"),
        ),
        body: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: HexColor("#f08804"),
              ),
              borderRadius: BorderRadius.circular(5.0)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Brand:iSunful",
                      color: Colors.lightBlue[700],
                      subText: true,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: true ? Colors.yellow[800] : Colors.grey[400],
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: true ? Colors.yellow[800] : Colors.grey[400],
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: true ? Colors.yellow[800] : Colors.grey[400],
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: false ? Colors.yellow[800] : Colors.grey[400],
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: false ? Colors.yellow[800] : Colors.grey[400],
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: AppText(
                        "Camera 1 that it`s brand is huawaui and it`s size is 2.3 in. x 3.4 in.",
                        maxLines: 10,
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    constraints: BoxConstraints(maxHeight: 300, minHeight: 300),
                    color: Colors.grey[200],
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.network(
                        "https://picsum.photos/400/100",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("Quantity: "),
                            Flexible(
                              fit: FlexFit.loose,
                              child: AppText(
                                "16",
                                subText: true,
                              ),
                            )
                          ],
                        ), //quantity
                        Divider(
                          height: 10,
                          thickness: 1,
                          color: Colors.grey,
                          indent: 25,
                          endIndent: 25,
                        ),
                        AppText(
                          "Shippment and Fee Details",
                          bold: true,
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                side: BorderSide(color: Colors.grey[700])),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText("price:"),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                              fit: FlexFit.loose,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    "\$ ",
                                                    fontSize: 12,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: AppText(
                                                      "120 ",
                                                      subText: true,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          (true
                                              ? Flexible(
                                                  fit: FlexFit.loose,
                                                  child: AppText(
                                                    "\$130 ",
                                                    color: Colors.grey,
                                                    lineThrough: true,
                                                    subText: true,
                                                  ),
                                                )
                                              : Text('   a')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText("Discount"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "%",
                                            fontSize: 12,
                                          ),
                                          AppText("20"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText("Fees"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "%",
                                            fontSize: 12,
                                          ),
                                          AppText("20"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText("Return Price"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "\$",
                                            fontSize: 12,
                                          ),
                                          AppText("20"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    height: 10,
                                    thickness: 1,
                                    color: Colors.grey,
                                    indent: 25,
                                    endIndent: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        "Total Net",
                                        color: Colors.lightBlue[700],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            "\$",
                                            fontSize: 12,
                                          ),
                                          AppText("120"),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )), //price
                        AppText(
                          "Orders Details",
                          bold: true,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              side: BorderSide(color: Colors.grey[700])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText("Orders Number"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "",
                                          fontSize: 12,
                                        ),
                                        AppText("12"),
                                      ],
                                    )
                                  ],
                                ),
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText("Orders Return"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "",
                                          fontSize: 12,
                                        ),
                                        AppText("12"),
                                      ],
                                    )
                                  ],
                                ),
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText("Shipped"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "",
                                          fontSize: 12,
                                        ),
                                        AppText("12"),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey,
                                  indent: 25,
                                  endIndent: 25,
                                ),
                                  Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     AppText(
                                  "Total Return",
                                  color: Colors.lightBlue[700],
                                ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "",
                                          fontSize: 12,
                                        ),
                                        AppText("12"),
                                      ],
                                    )
                                  ],
                                ),
                              
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}


