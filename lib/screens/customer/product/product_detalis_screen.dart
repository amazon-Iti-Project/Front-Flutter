import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/product-model.dart';
import 'package:project/screens/customer/home/homepage.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/productService.dart';
import 'package:project/widgets/appbar.dart';


class ProductDetailsScreen extends StatefulWidget {
  final int id;
  ProductDetailsScreen({this.id});
  // ProductDetailsScreen(
  //   int id, {
  //   Key key,
  // }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final key = GlobalKey<FormState>();
  Product product;
  String langCode;

  @override
  void initState() {
    super.initState();
    langCode = 'en';
  }

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    setState(() {
      langCode =  myLocale.languageCode;      
    });
    getProductbyid();
    super.didChangeDependencies();
  }

  getProductbyid() async {
    var productVal = await ProductService().getProductByID(widget.id,langCode);
    setState(() {
      product = productVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(product != null){
      return Scaffold(
      body: SafeArea(
        child: Form(
          key: key,
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AmazonAppBar(),
                Container(
                    margin: EdgeInsets.only(
                        left: 15, top: 15, right: 20, bottom: 0),
                    child: Text(
                      "lkl",
                      // widget.product.name,
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
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Price : ",
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
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
                  ]),
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
    else{
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
                width: 100, height: 100, child: CircularProgressIndicator()),
          ));
    }
    }
}
