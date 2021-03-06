import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/categoryCollection-model.dart';
import 'package:project/services/Localization/applocalization.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants.dart';
import 'category.dart';

Future<List<CategoryCollection>> fetchCategories() async {
  print('entered!');
  final response = await http.get(API_URL + "/categoriesCollection");
  if (response.statusCode == 200) {
    print('data');
    return List<CategoryCollection>.from((jsonDecode(response.body) as List)
        .map((e) => CategoryCollection.fromJson((e)))).toList();
  } else {
    print("Error!");
    return [];
  }
}

class AllDepartments extends StatefulWidget {
  @override
  _AllDepartmentsState createState() => _AllDepartmentsState();
}

class _AllDepartmentsState extends State<AllDepartments> {

  Future<List<CategoryCollection>> allCategories;

  @override
  void initState() {
    super.initState();
    allCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
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
              icon: Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black, size: 28),
              onPressed: () {}),
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  AppLocalizations.of(context).translate('earthBigSelection'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[300])),
                child: FutureBuilder<List<CategoryCollection>>(
                  future: allCategories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final categories = snapshot.data;
                      return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Container(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Category(categoryItems: category.data,title: category.title,)));
                                },
                                title: Text(category.title),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 14,
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: new Border(
                                    bottom: new BorderSide(
                                        color: Colors.grey[300])),
                              ));
                        },
                      );
                    }
                    else{
                      return Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
