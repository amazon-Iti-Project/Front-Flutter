import 'package:flutter/material.dart';
import 'package:project/models/order.dart';
import 'package:project/modules/orders/order-card.dart';
import 'package:project/modules/orders/order-details.dart';
import 'package:project/modules/orders/order-service.dart';
import 'package:project/modules/orders/searchbar.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Order> orderList = new List();

  @override
  void initState() {
    super.initState();
    getOrderFromServer();
  }

  getOrderFromServer() async {
    orderList = await OrderService().getOrders();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                onTap: (index) {},
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Your Orders"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Buy Again"),
                  ),
                ],
              ),
              title: Text('YOUR ORDERS'),
            ),
            body:
                // SearchBar(),
                TabBarView(
              children: <Widget>[
                ListView.builder(
                    itemCount: orderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetails(post: orderList[index])),
                            );
                          },
                          child: OrderCard(
                            text: orderList[index].title,
                          ));
                    }),
                Text("adasdasd"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:project/models/order.dart';
// import 'package:project/modules/orders/order-card.dart';
// import 'package:project/modules/orders/order-details.dart';
// import 'package:project/modules/orders/order-service.dart';

// class OrderList extends StatefulWidget {
//   @override
//   _OrderListState createState() => _OrderListState();
// }

// class _OrderListState extends State<OrderList> {
//   List<Order> orderList = new List();

//   @override
//   void initState() {
//     super.initState();
//     getOrderFromServer();
//   }

//   getOrderFromServer() async {
//     orderList = await OrderService().getOrders();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DefaultTabController(
//         length: 2,
//         child: MaterialApp(
//           home: Scaffold(
//             appBar: AppBar(
//               bottom: TabBar(
//                 onTap: (index) {},
//                 tabs: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text("Your Orders"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text("Buy Again"),
//                   ),
//                 ],
//               ),
//               title: Text('YOUR ORDERS'),
//             ),
//             body: TabBarView(
//               children: [
// ListView.builder(
//     padding: const EdgeInsets.all(8),
//     itemCount: orderList.length,
// itemBuilder: (BuildContext context, int index) {
//   return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//               OrderDetails(post: orderList[index])),
//         );
//       },
//       child: OrderCard(
//         text: orderList[index].title,
//       ));
// }),
// Text("asdasdasd")
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
