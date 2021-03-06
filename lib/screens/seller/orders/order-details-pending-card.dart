import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/order-model.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';

class OrderDetailsPendingCard extends StatefulWidget {
  final Order order;
  OrderDetailsPendingCard({this.order});
  @override
  OrderDetailsPendingCardState createState() => OrderDetailsPendingCardState();
}

class OrderDetailsPendingCardState extends State<OrderDetailsPendingCard> {
  bool isDetailsShown = false;
  final String localizedParentData = "SellerOrders";

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
                                child: LocalizedText(
                                  localizedParentData,
                                  "orderId",
                                  bold: true,
                                  maxLines: 3,
                                ),
                              ),
                              AppText(
                                "${widget.order.id}",
                                bold: true,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LocalizedText(
                              localizedParentData,
                              "orderAmount",
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
                                      "${widget.order.orderPrice}",
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
                            LocalizedText(
                              localizedParentData,
                              "amazonFee",
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
                                      "${widget.order.shipmentPrice}",
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
                            LocalizedText(
                              localizedParentData,
                              "totalNet",
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
                                      "${widget.order.payment}",
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
                                child: LocalizedText(
                                  localizedParentData,
                                  "goToOrder",
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
                                      LocalizedText(
                                        localizedParentData,
                                        "orderDate",
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
                                      LocalizedText(
                                        localizedParentData,
                                        "paymentType",
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
                                      LocalizedText(
                                        localizedParentData,
                                        "shipmentDetails",
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LocalizedText(
                                        localizedParentData,
                                        "expectedDeliveryDate",
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
                                      LocalizedText(
                                        localizedParentData,
                                        "shipmentFee",
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
                                      LocalizedText(
                                        localizedParentData,
                                        "shipmentVia",
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
                                        child: LocalizedText(
                                          localizedParentData,
                                          "showLess",
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
                                    child: LocalizedText(
                                      localizedParentData,
                                      "showMore",
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
