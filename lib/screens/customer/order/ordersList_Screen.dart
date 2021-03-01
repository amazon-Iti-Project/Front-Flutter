import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/screens/customer/card/cart.dart';
import 'package:project/screens/customer/order/order-card.dart';
import 'package:project/screens/customer/order/order-details.dart';
import 'package:project/screens/customer/order/searchbar.dart';

// import '../applocalization.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Row(children: [
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.black, size: 28),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          }),
                      Container(
                          width: 100,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Image.asset('Images/amazon-black.png'),
                          )),
                    ])),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.keyboard_voice_outlined,
                                  color: Colors.black, size: 30),
                              onPressed: null),
                          IconButton(
                              icon: Icon(Icons.add_shopping_cart,
                                  color: Colors.black, size: 28),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CartScreen()));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromRGBO(133, 217, 225, 1),
                  Color.fromRGBO(165, 230, 206, 1)
                ])),
          ),
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 1.0),
                  DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                labelColor: Color.fromRGBO(133, 217, 225, 1),
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'Orders'),
                                  Tab(text: 'Buy Again'),
                                ],
                              ),
                            ),
                            Container(
                                height: 400, //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  Column(
                                    children: [
                                      SearchBar(),
                                      Center(
                                          child: Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[400]))),
                                              child: Container(
                                                height: 70,
                                                width: 800,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child:
                                                        DropdownButton<String>(
                                                      value: _chosenValue,
                                                      //elevation: 5,
                                                      style: TextStyle(
                                                          color: Colors.black),

                                                      items: <String>[
                                                        'Past 3 months',
                                                        'Last 30 days',
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      hint: Text(
                                                        "Past 3 months",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      onChanged:
                                                          (String value) {
                                                        setState(() {
                                                          _chosenValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ))),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        OrderDetails()));
                                          },
                                          child: Container(child: OrderCard()))
                                    ],
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text('Buy Again',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ]))
                          ])),
                ]),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:project/models/order.dart';
// // import 'package:project/modules/orders/order-card.dart';
// // import 'package:project/modules/orders/order-details.dart';
// // import 'package:project/modules/orders/order-service.dart';
// // import 'package:project/modules/orders/searchbar.dart';

// class OrderList extends StatefulWidget {
//   @override
//   _OrderListState createState() => _OrderListState();
// }

// class _OrderListState extends State<OrderList> {
//   // List<Order> orderList = new List();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getOrderFromServer();
//   // }

//   // getOrderFromServer() async {
//   //   orderList = await OrderService().getOrders();
//   //   setState(() {});
//   // }

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
//             body:
//                 // SearchBar(),
//                 TabBarView(
//               children: <Widget>[
//                 ListView.builder(
//                     itemCount: orderList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       OrderDetails(post: orderList[index])),
//                             );
//                           },
//                           child: OrderCard(
//                             text: orderList[index].status,
//                           ));
//                     }),
//                 Text("adasdasd"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
