import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/services/Localization/applocalization.dart';


class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      AppLocalizations.of(context).translate('selectAddress'),
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
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300])),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            onChanged: (bool value) {
                              print('ok');
                            },
                            tristate: true,
                            value: true,
                            activeColor: Colors.orange[400],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("salma zaki",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text('my address'),
                              Text('Egypt'),
                              Text(AppLocalizations.of(context)
                                      .translate('phoneNumber') +
                                  "000000000")
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CheckoutScreen()));
                          },
                          color: Color.fromRGBO(242, 196, 89, 1),
                          child: Text(AppLocalizations.of(context)
                              .translate('deliverToAddress')),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckoutScreen()));
                                },
                                color: Colors.grey[100],
                                child: Text(AppLocalizations.of(context)
                                    .translate('edit')),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckoutScreen()));
                                },
                                color: Colors.grey[100],
                                child: Text(AppLocalizations.of(context)
                                    .translate('remove')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Container(
                          child: ListTile(
                            onTap: () {},
                            title: Text(AppLocalizations.of(context)
                                .translate('addNewAddress')),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.grey[300]),
                          ),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          onTap: () {},
                          title: Text(AppLocalizations.of(context)
                              .translate('shipToAmazonPickup')),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.grey[300]),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          onTap: () {},
                          title: Text(AppLocalizations.of(context)
                              .translate('shipToMultiAddress')),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.grey[300]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
