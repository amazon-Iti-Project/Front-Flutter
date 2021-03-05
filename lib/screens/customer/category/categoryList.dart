import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD:lib/screens/categoryList.dart
import 'package:project/Product.dart';
import 'package:project/modules/products.dart';
import 'package:project/screens/product_detalis_screen.dart';
import 'package:project/widgets/appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../applocalization.dart';
=======
import 'package:project/models/product.dart';
import 'package:project/screens/customer/product/product_detalis_screen.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/productService.dart';
import 'package:project/widgets/appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart

class CategoryList extends StatefulWidget {
  final String catName;
  CategoryList({this.catName});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
<<<<<<< HEAD:lib/screens/categoryList.dart
  Future<List<Product>> futurePosts;
=======
  List<Product> productsList = new List();
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD:lib/screens/categoryList.dart
    futurePosts = fetchProducts();
=======
    getProducts();
  }

  getProducts() async {
    productsList = await ProductService().getProductsByCatID(widget.catName);
    setState(() {});
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AmazonAppBar(),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[400]))),
            child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8.0),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)
                              .translate('delivery')),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)
                                .translate('CompAccessories')),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)
                                .translate('category')),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context).translate('results'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ),
<<<<<<< HEAD:lib/screens/categoryList.dart
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductDetailsScreen()));
=======
                Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  child: ListView.builder(
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      final product = productsList[index];
                      print(product.image);
                      return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetailsScreen()
                    ));
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      elevation: 0.0,
                      semanticContainer: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
<<<<<<< HEAD:lib/screens/categoryList.dart
                            child: Image.network(
                                'https://i01.appmifile.com/webfile/globalimg/in/cms/4BAADF0B-B0D8-D9C3-1D38-43BAB1F76080.jpg'),
=======
                            child: Image.network(product.image),
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
<<<<<<< HEAD:lib/screens/categoryList.dart
                                Text(
                                  "Laptop",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
=======
                                Container(
                                  width: 100,
                                  child: Text(product.name,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),),
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
                                ),
                                RatingBar.builder(
                                  itemSize: 16,
                                  initialRating: 4.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Row(
                                  children: [
<<<<<<< HEAD:lib/screens/categoryList.dart
                                    Text("\$59.99",
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                    Text('\$62.99',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough))
=======
                                    Text("\$"+product.price.toString(),style: TextStyle(
                                      fontSize: 18,
                                    )),
                                    Text('\$'+product.oldPrice.toString(),style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                    ))
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
<<<<<<< HEAD:lib/screens/categoryList.dart
                ),
              
=======
                );
                    }
                  ),
                ),
>>>>>>> 67841f14d905cedbaf64a582625848dd4aa856a4:lib/screens/customer/category/categoryList.dart
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get("https://fierce-mountain-42224.herokuapp.com/products");

  if (response.statusCode == 200) {
    return parseProducts(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
