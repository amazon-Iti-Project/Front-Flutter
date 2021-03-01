import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/Ui/seller/inventory/seller-inventory-details.dart';
import 'package:project/Ui/seller/payment/payment-details.dart';

import '../../app-text.dart';

class SellerPayments extends StatefulWidget {
  @override
  SellerPaymentsState createState() => SellerPaymentsState();
}

class SellerPaymentsState extends State<SellerPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Payments '),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>SellerPaymentDetails())
              );
            },
            child: Card(
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText("Payment Id"),
                                    Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                               AppText(
                                              "\$ ",
                                              fontSize:12,
                                            ),
                                            AppText(
                                              "120 ",
                                              subText: true,
                                            ),
                                          ],
                                        )),
                                         Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                               AppText(
                                              "\$ ",
                                              fontSize:12,
                                            ),
                                            AppText(
                                              "120 ",
                                              subText: true,
                                            ),
                                          ],
                                        ),
                                    (true
                                        ? Flexible(
                                            fit: FlexFit.loose,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: AppText(
                                                "\$130 ",
                                                color: Colors.grey,
                                                lineThrough: true,
                                                subText: true,
                                              ),
                                            ),
                                          )
                                        : null),
                                  ].where((Object o) => o != null).toList(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: AppText(
                                        "Quantity: 16",
                                        subText: true,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
