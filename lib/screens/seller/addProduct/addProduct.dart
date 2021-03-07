import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/brand-model.dart';
import 'package:project/models/categoryCollection-model.dart';
import 'package:project/models/product-model.dart';
import 'package:project/models/shipping-model.dart';
import 'package:project/screens/seller/addProduct/picK-Image.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';
import 'package:project/services/brandService.dart';
import 'package:project/services/categoryService.dart';
import 'package:project/services/feeService.dart';

import 'addProductDropDown.dart';
import 'addProductInput.dart';

enum Orders {
  pending,
  delieved,
}

extension OrderExtension on Orders {
  num get value {
    switch (this) {
      case Orders.pending:
        return 1;
      case Orders.delieved:
        return 2;
      default:
        return null;
    }
  }

  Orders getOrderType(num state) {
    //1
    switch (state) {
      case 1:
        return Orders.pending;
      case 2:
        return Orders.delieved;
      default:
        return null;
    }
  }
}

class SellerAddProduct extends StatefulWidget {
  @override
  SellerAddProductState createState() => SellerAddProductState();
}

class SellerAddProductState extends State<SellerAddProduct> {
  final _formKey = GlobalKey<FormState>();
  String localizedParentData = 'SellerAdd';
  Product product;
  Shipping shipment;
  List<Datum> catList = [Datum(name: "")];
  List<Brand> brandList = [Brand(name: "")];

  // final controller = TextEditingController();
  FeeService feeServ = FeeService();
  @override
  void initState() {
    super.initState();

    Orders myOrder;
    // print("enum: ${myOrder.value}");

    Orders newOrder = myOrder.getOrderType(2);
    // print("enum: $newOrder");

    // print("enum: ${myOrder.value}");
    product = Product();
    shipment = Shipping();
    product.shipping = shipment;
    CategoryService catServ = CategoryService();
    catServ.getAllCategories().then((res) => {
          print("${this.catList}"),
          setState(() {
            this.catList = res;
            this.product.category = res[0].id;
            print("catId: ${res[0].toString()}");
            feeServ.getFeebyCatId(this.product.category).then((res) => {
                  // print("Res: ${res.toString()}"),
                  setState(() {
                    this.product.fee = res;
                    print("newSelcFee: ${this.product.fee.toString()}");
                  }),
                });
          }),
        });

    BrandService brandServ = BrandService();
    brandServ.getAllBrands().then((res) => {
          print("${this.catList}"),
          setState(() {
            this.brandList = res;
          }),
        });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("size: ${MediaQuery.of(context).size.height}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
    // controller.dispose();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("parent setState");
  }

  @override
  Widget build(BuildContext context) {
    print("build add product done");
    // print(product.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        title: const Text('add Product'),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: ListView(
                  children: <Widget>[
                    LocalizedText(
                      localizedParentData,
                      'vitalInfo',
                      bold: true,
                    ),
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(
                            color: HexColor("#f08804"),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            AddProductDropDown(
                              name: "chooseCategory",
                              list: this.catList,
                              onDropChange: (Datum selectedCat) {
                                this.product.category = selectedCat.id;

                                feeServ
                                    .getFeebyCatId(selectedCat.id)
                                    .then((res) => {
                                          // print("Res: ${res.toString()}"),
                                          this.product.fee = res,
                                          print(
                                              "newSelcFee: ${this.product.fee.toString()}"),
                                        })
                                    .catchError(
                                        (err) => print("NewSelcFeeErr:$err"));
                                // print("selectedCat id is: $selectedCat");
                              },
                              validFun: (Datum selectedCat) {
                                if (selectedCat != null &&
                                    selectedCat.id == this.product.category)
                                  return true;
                                return null;
                              },
                              errorText: 'select a Category',
                            ),
                            AddProductDropDown(
                              name: "chooseBrand",
                              list: this.brandList,
                              onDropChange: (Brand selectedCat) {
                                this.product.brand = selectedCat.id;
                                FeeService feeServ = FeeService();
                                feeServ
                                    .getFeebyCatId(selectedCat.id)
                                    .then((res) => {
                                          this.product.fee = res,
                                        })
                                    .catchError((err) => print("$err"));

                                // print("selected brand id is: $selectedCat");
                              },
                              validFun: (Brand selectedBrand) {
                                if (selectedBrand != null &&
                                    selectedBrand.id == this.product.brand)
                                  return true;
                                return null;
                              },
                              errorText: 'select a brand',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(
                            color: HexColor("#f08804"),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SellerAddProductInput(
                              "productName",
                              // controller: this.controller,
                              hintTxt: "ex: camera c50",
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.name = value;
                                print(this.product.name);
                              },
                            ),
                            SellerAddProductInput(
                              "productDescribtion",
                              // controller: this.controller,
                              hintTxt: "ex: camera c50 with dim 2.54 inch ",
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.description = value;
                                print(this.product.description);
                              },
                            ),
                            SellerAddProductInput(
                              "size",
                              // controller: this.controller,
                              hintTxt: "ex: 5.3 x 4.2 inch ",
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.description = value;
                                print(this.product.size);
                              },
                            ),
                            SellerAddProductInput(
                              "color",
                              // controller: this.controller,
                              hintTxt: "ex: red ",
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.description = value;
                                print(this.product.size);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    LocalizedText(
                      localizedParentData,
                      "image",
                      bold: true,
                    ),
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(
                            color: HexColor("#f08804"),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PhotoPicker(
                                onPickImage: (String imgUrl) {
                                  this.product.image = imgUrl;
                                },
                              ),
                            ]),
                      ),
                    ),
                    LocalizedText(
                      localizedParentData,
                      "offer",
                      bold: true,
                    ),
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(
                            color: HexColor("#f08804"),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SellerAddProductInput(
                              "price",
                              // controller: this.controller,
                              hintTxt: "ex: 120\$",
                              validFun: (String value) {
                                if (value.length < 5) return 'min 5 char';
                                return null;
                              },
                              onChange: (String value) {
                                double val = double.parse(value);
                                this.product.price = val;
                                if (!val.isNaN) {
                                  print("not a number: $val");
                                } else {
                                  print("not a number: $val");
                                }
                              },
                              keyboard: TextInputType.number,
                            ),
                            SellerAddProductInput(
                              "discount",
                              // controller: this.controller,
                              hintTxt: "ex: 20% ",
                              keyboard: TextInputType.number,
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.description = value;
                                print(this.product.description);
                              },
                            ),
                            Container(
                              alignment: Alignment(-1, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LocalizedText(
                                            localizedParentData, "fees"),
                                        AppText(this.product.fee == null
                                            ? ""
                                            : this.product.fee.fee.toString()),
                                      ]),
                                ],
                              ),
                            ),
                            SellerAddProductInput(
                              "shippingPeriod",
                              // controller: this.controller,
                              keyboard: TextInputType.number,
                              hintTxt: "ex: 2 days ",
                              validFun: (String value) {
                                double parsedValue;
                                     // Variable name should start with small letter
                                try {
                                  parsedValue = double.parse(value);
                                } catch (e) {
                                  print("error in double: $e");
                                  return 'please enter valid number';
                                }
                                if (parsedValue.isNaN ||
                                    parsedValue < 2) return 'min 1 day';
                                return null;
                              },
                              onChange: (String value) {
                                this.shipment.period = int.parse(value);
                                print(this.product.size);
                              },
                            ),
                            SellerAddProductInput(
                              "color",
                              // controller: this.controller,
                              hintTxt: "ex: red ",
                              validFun: (String value) {
                                if (value.length < 5) return ',min char';
                                return null;
                              },
                              onChange: (String value) {
                                this.product.description = value;
                                print(this.product.size);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: MediaQuery.of(context).size.height < 640 ? 2 : 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      // height: 100,
                      // constraints:BoxConstraints(minWidth: double.infinity),
                      // alignment:AlignmentDirectional(0,1) ,

                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: RaisedButton(
                        disabledColor: HexColor("#e8c878"),
                        disabledTextColor: Colors.grey[500],
                        elevation: 5,
                        color: HexColor("#edc350"),
                        textColor: Colors.black,
                        child: LocalizedText(
                          "SellerAdd","add",
                          fontSize: 20,
                        ),
                        onPressed: false
                            ? () {
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.

                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                                return null;
                              }
                            : () {
                                // return showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     return AlertDialog(
                                //       // Retrieve the text the that user has entered by using the
                                //       // TextEditingController.
                                //       content: Text(this.product.name),
                                //     );
                                //   },
                                // );

                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.

                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => SellerInventroy()),
                                // );
                              },
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
