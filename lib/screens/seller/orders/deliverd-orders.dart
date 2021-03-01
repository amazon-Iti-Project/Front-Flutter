import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'order-details-delivered-card.dart';

class SellerDeliveredOrders extends StatefulWidget {
  @override
  SellerDeliveredOrdersState createState() => SellerDeliveredOrdersState();
}

class SellerDeliveredOrdersState extends State<SellerDeliveredOrders> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SellerInventroyDetails()));
                },
                child:OrderDetailsDeliveredCard()
              );
            },
          ),
        ),
      ],
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
