import 'package:flutter/material.dart';
import 'package:project/screens/customer/card/cart.dart';
import 'package:project/services/Localization/applocalization.dart';

class AmazonAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(children: [
                  IconButton(
                      icon: Icon(Icons.menu, color: Colors.black, size: 28),
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      }),
                  Container(
                      width: 100,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Image.asset('Images/amazon-black.png'),
                      )),
                ])),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.keyboard_voice_outlined,
                              color: Colors.black, size: 30),
                          onPressed: null),
                      IconButton(
                          icon: Icon(Icons.add_shopping_cart,
                              color: Colors.black, size: 28),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => CartScreen()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black),
                  suffixIcon: Icon(Icons.photo_camera_outlined),
                  hintText: AppLocalizations.of(context).translate('searchStat'),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()
                )),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(133, 217, 225, 1),
              Color.fromRGBO(165, 230, 206, 1)
            ])),
      ),
    );
  }
}
