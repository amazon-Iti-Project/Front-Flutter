import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/user.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/userService.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  String userToken = "684a359c-da5b-1c01-8c51-1991fc8c2fb6";
  final myController = TextEditingController();
  User currentUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }
  getUser() async {
    currentUser = await UserService().getUserByToken(userToken);
    setState(() {});
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:
                      Text(AppLocalizations.of(context).translate('addNewAddress'),
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
                        initialValue: '',
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: AppLocalizations.of(context).translate('fName'),
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
                          labelText: AppLocalizations.of(context).translate('phoneNumber'),
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
                              hintText: AppLocalizations.of(context).translate('addressHint1'),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: AppLocalizations.of(context).translate('address'),
                              border: OutlineInputBorder()),
                          ),
                          TextFormField(
                            initialValue: '',
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).translate('addressHint2'),
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
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         CheckoutScreen()));
                          print(myController.text);
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
  }
}
