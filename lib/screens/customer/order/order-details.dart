import 'package:flutter/material.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/screens/customer/order/order-timeline.dart';
import 'package:project/screens/customer/order/order.dart';
// import 'package:project/models/order.dart';
// import 'package:project/modules/orders/order-timeline.dart';

class OrderDetails extends StatefulWidget {
  final Order post;
  OrderDetails({this.post});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Image.network('https://picsum.photos/100/100'),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(60.0, 1.0, 10.0, 10.0),
                        child: Text(
                          'Arrived in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(60.0, 1.0, 10.0, 10.0),
                        child: Text(
                          '24 Aug 2020',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ScreenProgress(ticks: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Tracking info provided by Amazon',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '   Shipped with Cart2india',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Tracking ID : 00000 ',
                              style: TextStyle(fontSize: 22),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'Address Info',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      '304 East 42nd Street -New York , USA',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // children: [
      // OrderTimeline(),
      // Image.network('https://picsum.photos/400/300'),
      // Padding(
      // padding: const EdgeInsets.fromLTRB(50.0, 0.1, 70.0, 10.0),
      // padding: const EdgeInsets.all(9.0),
      //   child: Text(widget.post.body),
      // ),
      // ],
    );
  }
}
