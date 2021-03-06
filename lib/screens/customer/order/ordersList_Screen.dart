import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/orderlist-model.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/screens/customer/order/order-card.dart';
import 'package:project/screens/customer/order/order-details.dart';
import 'package:project/screens/customer/order/searchbar.dart';
import 'package:project/services/orderlistService.dart';

// import '../applocalization.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  String _chosenValue;
  List<Order> orderList = new List();

  @override
  void initState() {
    super.initState();
    getOrderFromServer();
  }

  getOrderFromServer() async {
    orderList = await OrderListService().getOrders();
    setState(() {});
  }

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
              onPressed: () {}),
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
                                height: 700, //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  Column(children: [
                                    SearchBar(),
                                    Center(
                                        child: Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[400]))),
                                            child: Container(
                                              height: 70,
                                              width: 800,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: DropdownButton<String>(
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
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    onChanged: (String value) {
                                                      setState(() {
                                                        _chosenValue = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ))),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: orderList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OrderDetails(
                                                          order:
                                                              orderList[index],
                                                        ),
                                                      ));
                                                },
                                                child: Card(
                                                    child: OrderCard(
                                                  imgSrc: orderList[index]
                                                      .products[0]
                                                      .image,
                                                  status: orderList[index]
                                                      .status
                                                      .name,
                                                  orderName: orderList[index]
                                                      .products[0]
                                                      .name,
                                                )));
                                          }),
                                    ),
                                  ]),
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
