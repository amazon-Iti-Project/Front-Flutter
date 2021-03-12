import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/language.dart';
import 'package:project/screens/customer/Auth/login_screen.dart';
import 'package:project/screens/customer/category/allDepartments.dart';
import 'package:project/screens/customer/order/ordersList_Screen.dart';
import 'package:project/screens/seller/seller-home-screen.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/localizationService.dart';
import 'package:project/services/userService.dart';
import 'package:project/widgets/appbar.dart';

import '../../../main.dart';
import '../../your_account_screen.dart';
import 'homeScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSignedIn;
  void _changeLanguage(Language language) {
    print(language.languageCode);
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        print("English Switch");
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'MS');
        break;
    }
    LocalizationService().setLanguage(language.languageCode);
    MyApp.setLocale(context, _temp);
    // LocalizationService().getLanguage();

  }

  @override
  void initState() { 
    super.initState();
    _isSignedIn = false;
    getUser();
  }
  getUser() async {
    String token = await UserService().isUserSignedIn();
    if(token != null){
      _isSignedIn = true;
    }
    setState(() {});
  }
  logOut() async {
    var res = await UserService().logOutUser();
    if(res == true){
      _isSignedIn = false;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).translate('youLoggedOut')))
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
        elevation: 10,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 310,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFA4E3CC),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 18, 10, 5),
                  child: Text(
                    AppLocalizations.of(context).translate('hello'),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  AppLocalizations.of(context).translate('home'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => OrderList()));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Text(
                    AppLocalizations.of(context).translate('yourorder'),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text(
                    AppLocalizations.of(context).translate('yourlist'),
                    style: TextStyle(fontSize: 20),
                  ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourAccountScreen()),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('youraccount'),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AllDepartments()));
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: Text(
                        AppLocalizations.of(context).translate('shopbydep'),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, right: 8.0),
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SellerHomeScreen()));
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: Text(
                        AppLocalizations.of(context).translate('sell'),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, right: 8.0),
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                height: 2,
                width: 310,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 20, 10),
                child: DropdownButton(
                  underline: SizedBox(),
                  hint:
                      Text(AppLocalizations.of(context).translate('changelang'),
                          style: TextStyle(
                            fontSize: 18,
                          )),
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                          (lang) => DropdownMenuItem(
                                value: lang,
                                child: Row(
                                  children: <Widget>[
                                    Text(lang.flag),
                                    Text(lang.name),
                                  ],
                                ),
                              ))
                      .toList(),
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                ),
              ),
              InkWell(
                onTap: 
                _isSignedIn ?
                () {
                  print(_isSignedIn); 
                  logOut();
                  print(_isSignedIn);
                  } : () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Text(
                    _isSignedIn ?
                      AppLocalizations.of(context).translate('logout')
                    : AppLocalizations.of(context).translate('signIn'),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          HomeScreen(),
          AmazonAppBar(),
        ],
      ),
    );
  }
}
