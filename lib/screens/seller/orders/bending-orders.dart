import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'order-details-card.dart';

class SellerBendingOrders extends StatefulWidget {
  @override
  SellerBendingOrdersState createState() => SellerBendingOrdersState();
}

class SellerBendingOrdersState extends State<SellerBendingOrders> {
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
                child:OrderDetailsCard()
              );
            },
          ),
        ),
      ],
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
