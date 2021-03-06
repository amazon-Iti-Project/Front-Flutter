import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/seller/orders/order-details-pending-card.dart';


class SellerPendingOrders extends StatefulWidget {
  @override
  SellerPendingOrdersState createState() => SellerPendingOrdersState();
}

class SellerPendingOrdersState extends State<SellerPendingOrders> {
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
                child:OrderDetailsPendingCard()
              );
            },
          ),
        ),
      ],
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
