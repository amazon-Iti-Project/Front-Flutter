import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SellerAddProductInput extends StatelessWidget {
  Function validFun;
  SellerAddProductInput({this.validFun});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Product Name",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              color: HexColor("#f08804"),
            ),
          ),
        ),
        TextFormField(
          style: TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#f08804"), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#232F3E"), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#232F3E"), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              contentPadding: EdgeInsets.all(8),
              // labelText:"Product Name",
              // labelStyle: TextStyle(
              //   color:HexColor("#232F3E"),
              //   fontSize: 25
              // ),
              // prefixText:"prefix",
              // prefixStyle:TextStyle(
              //   color:HexColor("#232F3E"),
              //   fontSize: 25
              // ),
              // prefix:Text("kamal"),
              hintText: "ex:camera c50",
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              )),
          validator: this.validFun != null
              ? this.validFun
              : (value) {
                  if (value.isEmpty) return 'Please enter some text';
                  return null;
                },
        ),
      ]),
    );
  }
}
