import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/categoryCollection-model.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/widgets/categoryHeader.dart';
import 'package:project/widgets/singleItem.dart';

import 'allDepartments.dart';
import 'categoryList.dart';

class Category extends StatefulWidget {
  final List<Datum> categoryItems;
  final String title;
  Category({this.categoryItems, this.title});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AllDepartments()));
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Text(AppLocalizations.of(context).translate('allDep'),
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          CategoryHeader(
              title: widget.title,
              description:
                  "Shop laptops, desktops, monitors, tablets, PC gaming, hard drivers and storage, accessories and more"),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).translate('shopByCat'),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemCount: widget.categoryItems.length,
                      itemBuilder: (context, index) {
                        final singleCategory = widget.categoryItems[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryList(catId: singleCategory.id)));
                          },
                          child: SingleItem(
                            name: singleCategory.name,
                            imgSrc: singleCategory.image,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
