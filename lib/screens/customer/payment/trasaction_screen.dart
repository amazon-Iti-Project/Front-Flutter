import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/order-model.dart';
import 'package:project/models/user-model.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/payment_services.dart';
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

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    setState(() {
      langCode = myLocale.languageCode;
    });
    getPaymentbycId();
    super.didChangeDependencies();
  }

  Future<void> getPaymentbycId() async {
    var paymentval = await PaymentService().getPaymentByUserID(user.id);
    setState(() {
      paymentlist = paymentval;
    });
  }

  @override
  void initState() {
    super.initState();
    langCode = 'en';
    future = getPaymentbycId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmazonAppBar(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Your Payments",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.grey,
                height: 1,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Transaction",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf1c65d),
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: future,
                  builder: (c, s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: paymentlist.length,
                          itemBuilder: (ctx, index) {
                            final payment = paymentlist[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFf1c65d)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Date :",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(payment.payment.date),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "transactionaltype"),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text("12/5/2020"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate("orderprice"),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text("12/5/2020"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "delivereddate"),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text("12/5/2020"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "shipmentfees"),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text("12/5/2020"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "transactionaltotal"),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text("300 LE"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    ;
                  }),
            ],
          ),
        ]),
      ),
    );
  }
}
