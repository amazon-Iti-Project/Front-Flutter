import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/Ui/seller/addProduct/picK-Image.dart';
import 'package:project/Ui/seller/inventory/seller-inventory.dart';

import 'addProductDropDown.dart';
import 'addProductInput.dart';

class SellerAddProduct extends StatefulWidget {
  @override
  SellerAddProductState createState() => SellerAddProductState();
}

class SellerAddProductState extends State<SellerAddProduct> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SellerAddProductInput(),
                    SellerAddProductInput(),
                    SellerAddProductInput(),
                    AddProductDropDown(),
                    AddProductDropDown(),
                       PhotoPicker(),
                    
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      // height: 50,
                      // constraints:BoxConstraints(minWidth: double.infinity),
                      // alignment:AlignmentDirectional(0,1) ,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: RaisedButton(
                        elevation: 5,
                        color: HexColor("#edc350"),
                        textColor: Colors.black,
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SellerInventroy()),
                          );
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