import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/order-model.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/order/ordersList_Screen.dart';
import 'package:project/services/orderService.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/productService.dart';
import 'package:project/services/userService.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  String userToken = "aea407a0-7f44-fcd0-c325-b1b3cbbe7711";
  final myController = TextEditingController();
  User currentUser;
  String userName;
  Order myOrder;
  var ship;
  var total;
  var maxDuration;
  String address;

  @override
  void initState() {
    super.initState();
    userName = '';
    ship = 0;
    total =0;
    maxDuration =0;
    myOrder = new Order();
    address= myController.text;
    getUser();
  }

  getUser() async {
    currentUser = await UserService().getUserByToken(userToken);
    var list = await ProductService().getProductListByID(currentUser.cart,'en');
    for (var i = 0; i < list.length; i++) {
      ship += list[i].shipping.shipPrice;
      total += list[i].price;
      if (list[i].shipping.period > maxDuration)
        maxDuration = list[i].shipping.period;
    }
    setState(() {
      userName = currentUser.username;
    });
    setState(() {});
  }

  submitOrder() async {
    setState(() {});
    myOrder =  Order(
        address: address,
        canCancelledUntil: DateTime.now().add(new Duration(days: 3)),
        products: await ProductService().getProductListByID(currentUser.cart,'en'),
        customer: currentUser.id,
        status: 1,
        payment: 1,
        orderShip: ship,
        orderPrice: total,
        dueDate: DateTime.now().add(new Duration (days: maxDuration)),
        orderDate: DateTime.now()
    );
    await OrderService().CreateNewOrder(myOrder);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
        OrderList()));
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset('Images/amazon-black.png'),
          ),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                        AppLocalizations.of(context).translate('addNewAddress'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: currentUser.name,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText:
                                AppLocalizations.of(context).translate('fName'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: '',
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: AppLocalizations.of(context)
                                .translate('phoneNumber'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: myController,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .translate('addressHint1'),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: AppLocalizations.of(context)
                                      .translate('address'),
                                  border: OutlineInputBorder()),
                            ),
                            TextFormField(
                              initialValue: '',
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)
                                    .translate('addressHint2'),
                                fillColor: Colors.white,
                                filled: true,
                                // labelText: AppLocalizations.of(context).translate('address'),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                address = myController.text;
                              });
                              submitOrder();
                            },
                            color: Color.fromRGBO(242, 196, 89, 1),
                            child: Text(AppLocalizations.of(context)
                                .translate('addAddress')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
                width: 100, height: 100, child: CircularProgressIndicator()),
          ));
    }
  }
}
