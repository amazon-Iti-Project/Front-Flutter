import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/applocalization.dart';
import 'package:project/screens/homeScreen.dart';
import 'package:project/widgets/appbar.dart';

import 'main.dart';
import 'modules/language.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    MyApp.setLocale(context, _temp);
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text(
                  AppLocalizations.of(context).translate('yourorder'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text(
                  AppLocalizations.of(context).translate('yourlist'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text(
                  AppLocalizations.of(context).translate('youraccount'),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text(
                  AppLocalizations.of(context).translate('shopbydep'),
                  style: TextStyle(fontSize: 20),
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
            ],
          ),
        ),
      ),
      body:
      Stack(
        children: [
          HomeScreen(),
          AmazonAppBar(),
        ],
      ),
    );
  }
}
