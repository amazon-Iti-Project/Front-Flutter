import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/seller/addProduct/addProduct.dart';
import 'package:project/screens/seller/inventory/seller-inventory.dart';
import 'package:project/screens/seller/orders/seller-orders-home.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';

class SellerHomeScreen extends StatefulWidget {
  @override
  SellerHomeScreenState createState() => SellerHomeScreenState();
}

class SellerHomeScreenState extends State<SellerHomeScreen> {
  final localizedParentText = "SellerHomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: LocalizedText(
          localizedParentText,
          'title',
          color: Colors.white,
        ),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: ListView(
        children: [
          // inventory
          Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "inventorySummary",
                        bold: true,
                        maxLines: 3,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerAddProduct()));
                        },
                        child: LocalizedText(
                          localizedParentText,
                          "addProduct",
                          color: Colors.cyan[400],
                          subText: true,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "inventoryProductNumber",
                        subText: true,
                      ),
                      AppText(
                        "12",
                        subText: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "inventoryValue",
                        subText: true,
                      ),
                      AppText(
                        "\$12.00",
                        subText: true,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerInventroy()));
                        },
                        child: LocalizedText(
                          localizedParentText,
                          "viewYourInventory",
                          subText: true,
                          color: Colors.cyan[500],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // orders
          Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "ordersSummary",
                        bold: true,
                        maxLines: 3,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "pending",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "shipped",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "unshipped",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "returnRequest",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerOrdersHome()));
                        },
                        child: LocalizedText(
                          localizedParentText,
                          "viewYourOrders",
                          subText: true,
                          color: Colors.cyan[500],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // payment
          Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "paymentSummary",
                        bold: true,
                        maxLines: 3,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "balance",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "viewYourPayment",
                        subText: true,
                        color: Colors.cyan[500],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // sales
          Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "salesSummary",
                        bold: true,
                        maxLines: 3,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "orderedProduct",
                        subText: true,
                        bold: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: LocalizedText(
                          localizedParentText,
                          "period",
                          subText: true,
                        ),
                      ),
                      Expanded(
                        child: LocalizedText(
                          localizedParentText,
                          "sales",
                          textAlign: TextAlign.center,
                          subText: true,
                        ),
                      ),
                      Expanded(
                        child: LocalizedText(
                          localizedParentText,
                          "unit",
                          textAlign: TextAlign.end,
                          subText: true,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LocalizedText(
                          localizedParentText,
                          "today",
                          subText: true,
                        ),
                      ),
                      Expanded(
                        child: AppText(
                          "\$0.00",
                          textAlign: TextAlign.center,
                          subText: true,
                        ),
                      ),
                      Expanded(
                        child: AppText(
                          "5.0",
                          textAlign: TextAlign.end,
                          subText: true,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: LocalizedText(
                        localizedParentText,
                        "week",
                        subText: true,
                      )),
                      Expanded(
                          child: AppText(
                        "\$0.00",
                        textAlign: TextAlign.center,
                        subText: true,
                      )),
                      Expanded(
                          child: AppText(
                        "5",
                        textAlign: TextAlign.end,
                        subText: true,
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: LocalizedText(
                        localizedParentText,
                        "month",
                        subText: true,
                      )),
                      Expanded(
                          child: AppText(
                        "\$0.00",
                        textAlign: TextAlign.center,
                        subText: true,
                      )),
                      Expanded(
                          child: AppText(
                        "5",
                        textAlign: TextAlign.end,
                        subText: true,
                      )),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "viewYourOrders",
                        subText: true,
                        color: Colors.cyan[500],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // performance
          Card(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "performance",
                        bold: true,
                        maxLines: 3,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "buyerMessage",
                        subText: true,
                      ),
                      AppText(
                        "0",
                        subText: true,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalizedText(
                        localizedParentText,
                        "viewYourOrders",
                        subText: true,
                        color: Colors.cyan[500],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
