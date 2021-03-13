import 'package:flutter/material.dart';
import 'package:project/models/order-model.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/screens/customer/order/order-timeline.dart';
import 'package:project/enums/status-enum.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';

class OrderDetails extends StatefulWidget {
  Order order;

  OrderDetails({this.order});
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final String pageName = "OrdersDetails";
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      // widget.order = Order.fromJson(widget.json);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Container(
            width: 100,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset('Images/amazon-black.png'),
            )),
        actions: [
          IconButton(
              icon: Icon(Icons.keyboard_voice_outlined,
                  color: Colors.black, size: 30),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black, size: 28),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen()));
              }),
        ],
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(133, 217, 225, 1),
                Color.fromRGBO(165, 230, 206, 1)
              ])),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Image.network(widget.order.products[0].image,
                      height: 100, width: 100),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3, 1.0, 10.0, 10.0),
                          child:
                        // LocalizedText(
                        //   pageName,"title",
                        //   bold: true,
                        //   textAlign: TextAlign.start,
                        //   color: Colors.red,
                        //   maxLines: 3,
                        //   subText: true,
                          

                        // ),
                           Text(
                            widget.order.products[0].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3, 1.0, 10.0, 10.0),
                          child: Text(
                            "Price: ${widget.order.products[0].price} \$",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(3, 1.0, 10.0, 10.0),
                          child: Text(
                            widget.order.products[0].description,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ScreenProgress(
                  ticks: widget.order.status.value,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 25, right: 5),
                        child: Text(
                          'Ordered',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                          "${widget.order.orderDate.day} - ${widget.order.orderDate.month} - ${widget.order.orderDate.year}")
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, top: 25, bottom: 25, right: 80),
                        child: Text(
                          'Shipped',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, top: 25, bottom: 25, right: 20),
                        child: Row(
                          children: [
                            Text(
                              'Out For Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 25, bottom: 25, right: 5),
                        child: Text(
                          ' Arriving By ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                          "${widget.order.deliveredDate.day} - ${widget.order.deliveredDate.month} - ${widget.order.deliveredDate.year}")
                    ],
                  )
                ],
              ),
            ],
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
                              'Tracking ID: ${widget.order.id}             ',
                              style: TextStyle(fontSize: 20),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.order.address,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
