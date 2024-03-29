import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/order-model.dart';
import 'package:project/models/payment-model.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/Auth/login_screen.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/payment_services.dart';
import 'package:project/services/userService.dart';
import 'package:project/widgets/appbar.dart';

class TrasactionScreen extends StatefulWidget {
  TrasactionScreen({Key key}) : super(key: key);

  @override
  _TrasnactionScreenState createState() => _TrasnactionScreenState();
}

class _TrasnactionScreenState extends State<TrasactionScreen> {
  final key = GlobalKey<FormState>();
  var future;
  List<Order> paymentlist = [];
  User user;
  String langCode;
  String userToken;
  User currentUser;

  @override
  void initState() {
    super.initState();
    langCode = 'en';
    future = getUser();
  }

  Future<void> getUser() async {
    UserService userServ = UserService();
    userToken = await userServ.isUserSignedIn();
    if (userToken != null) {
      currentUser = await userServ.getUserByToken(userToken);
      print(currentUser.name);
      var paymentval =
          await PaymentService().getPaymentByUserID(currentUser.id);
      print("current user ${currentUser.id}");
      print(paymentval);
      setState(() {
        paymentlist = paymentval;
      });
      setState(() {});
    } else {
      print("no user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
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
        body: FutureBuilder(
            future: future,
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting &&
                  paymentlist.length == 0) {
                return Center(child: CircularProgressIndicator());
              }
              if (paymentlist.length == 0) {
                return Center(
                    child: Text(
                  "No Transaction yet",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ));
              } else
                return ListView.builder(
                    itemCount: paymentlist.length,
                    itemBuilder: (ctx, index) {
                      final payment = paymentlist[index].payment;
                      print("date is ${payment.date}");
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Your Transaction is",
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFFf1c65d)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Container(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xFFf1c65d)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 5, 7),
                                          child: Row(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)
                                                    .translate('date'),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                payment.date.toString(),
                                                style: TextStyle(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 7),
                                          child: Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'paymentstates'),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  " ${payment.state.toString().substring(14).toUpperCase()}")
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 7),
                                          child: Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate('paymenttype'),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                " ${payment.type.toString().substring(13).toUpperCase()}",
                                                style: TextStyle(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          child: Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'paymentValue'),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                " ${payment.payment.ceilToDouble().toString()}",
                                                style: TextStyle(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
            }),
      ),
    );
  }
}
