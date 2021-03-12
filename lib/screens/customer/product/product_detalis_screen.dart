import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/product-model.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/Auth/login_screen.dart';
import 'package:project/screens/customer/cart/cart.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/productService.dart';
import 'package:project/services/userService.dart';
import 'package:project/widgets/appbar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  ProductDetailsScreen({this.id});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final key = GlobalKey<FormState>();
  Product product;
  String langCode;
  var future;

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    setState(() {
      langCode = myLocale.languageCode;
    });
    getProductbyid();
    super.didChangeDependencies();
  }

  Future<void> getProductbyid() async {
    var productVal = await ProductService().getProductByID(widget.id);
    setState(() {
      product = productVal;
    });
  }

  @override
  void initState() {
    super.initState();
    langCode = 'en';
    future = getProductbyid();
  }

  buyThisProduct() async {
    String token = await UserService().isUserSignedIn();
    if (token != null) {
      User user = await UserService().getUserByToken(token);
      var res = await UserService().addToCart(user, widget.id);
      if(res != null){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (c, s) {
        if (s.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator())
            ));
        } else
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
            body: SafeArea(
              child: Form(
                key: key,
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            // height: 200,
                            child: Image.network(product.image)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, right: 20, bottom: 0),
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Description ",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 18),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              product.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 20, bottom: 0),
                                  child: Row(children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Seller :",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        product.seller.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 20, bottom: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Price :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          " ${product.price.toString()} EGP",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 20, bottom: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Rate :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Text(
                                              product.rate.toString(),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                              child: Icon(
                                                Icons.star_rate,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                              Icons.star_half_sharp,
                                              color: Colors.amber,
                                            ),
                                            Icon(
                                                Icons
                                                    .star_border_purple500_sharp,
                                                color: Colors.amber)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 20, bottom: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Brand :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          product.brand.toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 20, bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Screen Size :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          product.size,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFf1c65d)),
                      ),
                      onPressed: () {
                        buyThisProduct();
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 18, 5),
                            padding: EdgeInsets.all(5),
                            color: Colors.black54,
                            child: Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(AppLocalizations.of(context).translate('buynow'),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
      },
    );
  }
}
