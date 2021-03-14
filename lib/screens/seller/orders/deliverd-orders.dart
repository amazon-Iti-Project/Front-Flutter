import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/order-model.dart';
import 'package:project/services/orderService.dart';
import 'order-details-delivered-card.dart';

class SellerDeliveredOrders extends StatefulWidget {
  @override
  SellerDeliveredOrdersState createState() => SellerDeliveredOrdersState();
}

class SellerDeliveredOrdersState extends State<SellerDeliveredOrders> {
  Future<List<Order>> futureOrders;
  @override
  void initState() {
    super.initState();
    futureOrders = OrderService().getDeliveredOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: futureOrders,
        builder: (context, snapshot) {
          final orders = snapshot.data;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    final order = orders[index];
                    return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SellerInventroyDetails()));
                        },
                        child: OrderDetailsDeliveredCard(order: order,));
                  },
                ),
              ),
            ],
          );
          //  AppLocalizations.of(context).translate('shopbydep')
        });
  }
}
