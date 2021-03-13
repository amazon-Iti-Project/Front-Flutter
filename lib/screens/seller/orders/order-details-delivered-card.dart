import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/order-model.dart';
import 'package:project/screens/customer/order/order-details.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';

class OrderDetailsDeliveredCard extends StatefulWidget {
  final Order order;
  OrderDetailsDeliveredCard({this.order});
  @override
  OrderDetailsCardState createState() => OrderDetailsCardState();
}

class OrderDetailsCardState extends State<OrderDetailsDeliveredCard> {
  bool isDetailsShown = false;
  final String localizedParentData = "SellerOrders";

  calcFees(){
    var fees =0;
    List products = widget.order.products;
    products.forEach((prod) { 
      fees += prod.fee.fee;
    });
    return fees;
  }
  calcNetPrice(){
    return widget.order.orderPrice + widget.order.shipmentPrice - calcFees();
  }
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
                                widget.order.id.toString(),
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
                              "totalPaid",
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
                                      widget.order.orderPrice.toString(),
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
                                      calcFees().toString(),
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
                              "shipment",
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
                                      widget.order.shipmentPrice.toString(),
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
                                      calcNetPrice(),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderDetails(order: widget.order,)));
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
                                                widget.order.orderDate.toString(),
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
                                                widget.order.payment.type.toString(),
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
                                        widget.order.customer.toString(),
                                        bold: true,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(
                                        widget.order.address,
                                        subText: true,
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     AppText(
                                  //       "01115404643",
                                  //       subText: true,
                                  //     ),
                                  //   ],
                                  // ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LocalizedText(
                                        localizedParentData,
                                        "paymentDetails",
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
                                        "paymentDate",
                                        subText: true,
                                      ),
                                      AppText(
                                        widget.order.orderDate.toString(),
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
                                        "payment",
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
                                            widget.order.payment.payment.toString(),
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
