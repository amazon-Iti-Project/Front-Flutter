import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/order-model.dart';
import 'package:project/screens/seller/orders/order-details-pending-card.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/services/orderService.dart';

class SellerPendingOrders extends StatefulWidget {
  @override
  SellerPendingOrdersState createState() => SellerPendingOrdersState();
}

class SellerPendingOrdersState extends State<SellerPendingOrders> {
  Future<List<Order>> futureOrders;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderService orderServ = OrderService();
    futureOrders = orderServ.getPendingOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          child: OrderDetailsPendingCard(order:order));
                    },
                  ),
                ),
              ],
            );
          } else {
            Widget w = snapshot.hasError
                ? Center(child: AppText("error${snapshot.error.toString()}",maxLines:10 ,))
                : Center(child: CircularProgressIndicator());
            return w;
          }
        });
  }
}
