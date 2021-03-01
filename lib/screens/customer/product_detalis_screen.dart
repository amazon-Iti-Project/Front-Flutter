import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Ui/applocalization.dart';
import 'package:project/Ui/homepage.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final key = GlobalKey<FormState>();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon"),
      ),
      body: SafeArea(
        child: Form(
          key: key,
          child: ListView(children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: 15, top: 15, right: 20, bottom: 0),
                    child: Text(
                      "ASUS Laptop L210 Ultra Thin Laptop, 11.6” HD Display, Intel Celeron N4020 Processor, 4GB RAM, 64GB Storage, NumberPad, Windows 10 Home in S Mode with One Year of Microsoft 365 Personal, L210MA-DB01",
                      style: TextStyle(fontSize: 20),
                    )),
                Center(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: 200,
                      child: Image.asset("Images/product.png")),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Price : ",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 18),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          " 999.99 LE",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]
                  ),
                ),
            
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Brand",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "ASUS",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Screen Size	",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "13.3 Inches",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Operating System",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Windows 10 Home",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "CPU Manufacturer	",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Intel",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Computer Memory Size",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "16 GB",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RaisedButton(
                color: Color(0xFFf1c65d),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
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
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 15, 7),
              child: RaisedButton(
                color: Color(0xFFe69027),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 18, 5),
                        padding: EdgeInsets.all(5),
                        color: Colors.black54,
                        child: Icon(
                          Icons.shopping_cart_sharp,
                          color: Colors.white,
                        )),
                    Text(AppLocalizations.of(context).translate('addtocart'),
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
