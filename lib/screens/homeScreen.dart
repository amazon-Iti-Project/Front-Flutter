import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/widgets/nineSections.dart';

import '../applocalization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            height: 50,
            color: Color.fromRGBO(191, 236, 233, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(AppLocalizations.of(context).translate('egyDelivery'),
                   style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
                'https://i.pinimg.com/originals/78/a1/28/78a128c4f2cf637bf14e24ca12b68dbe.jpg')),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('signInForBestEx'),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 2.0)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Color.fromRGBO(242, 196, 89, 1),
                      child: Text(AppLocalizations.of(context).translate('signIn')),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).translate('createAccount'),
                      ))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  'https://d39w7f4ix9f5s9.cloudfront.net/dims4/default/914813a/2147483647/strip/true/crop/1428x747+0+1/resize/1200x628!/quality/90/?url=http%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2Fb4%2F02%2F0e1bea25437682bcac70af850825%2Fdefault-image-3x.png')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Hero/Fuji_TallHero_Beauty_v2_en_US_1x._CB429089975_.jpg')),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('dealOfTheDay'),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 2.0)),
                  Container(
                    width: 200,
                    child: Center(
                      child: Image.network(
                          'https://images-na.ssl-images-amazon.com/images/I/81glSBXGG0L._AC_SX425_.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context).translate('dealOffer')),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("\$16.29 - \$55.99"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context).translate('endsIn')),
                      CountdownFormatted(
                        duration: Duration(hours: 10),
                        builder: (BuildContext ctx, String remaining) {
                          return Text(
                            remaining,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ); // 01:00:00
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context).translate('allDeals'),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Hero/Fuji_TallHero_Home_v2_en_US_1x._CB429090084_.jpg')),
        ),
        NineSections(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: Divider(color: Colors.black),
              ),
              Text(AppLocalizations.of(context).translate('reachEnd')),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: Divider(color: Colors.black),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('exploreDeps'),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          child: Image.network('https://images.unsplash.com/photo-1500840216050-6ffa99d75160?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1073&q=80'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('beauty')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          // child: Image.network('https://images.zadinteriors.com/blog/2020/02/Simple-and-Affordable-Home-Decor-Ideas.jpg'),
                          child:Image.network('https://images.unsplash.com/photo-1558944351-3f79926e74ef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80')
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('homeAndKitchen')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          child: Image.network('https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('sportsAndOutdoors')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          child: Image.network('https://images.unsplash.com/photo-1547982033-1aa007c7f612?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('electronics')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          child: Image.network('https://images.unsplash.com/photo-1501555088652-021faa106b9b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('outClothes')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.43,
                          child: Image.network('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('petSupplies')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),
                Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context).translate('allDep'),
                          )),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
