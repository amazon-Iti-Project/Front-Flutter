import 'package:flutter/material.dart';
import 'package:project/models/order.dart';
import 'package:project/modules/orders/order-timeline.dart';

class OrderDetails extends StatefulWidget {
  Order post;
  OrderDetails({this.post});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: ListView(
        children: [
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
            padding: const EdgeInsets.all(8.0),
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
                              fontWeight: FontWeight.bold, fontSize: 25),
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
          )
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
