import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';

class SellerAddProductInput extends StatelessWidget {
  final Function validFun;
  final String localizedParentData = "SellerAdd";
  final String name ;
  final Function onChange;
  final TextEditingController controller;
  final String hintTxt;
  final TextInputType keyboard;
  SellerAddProductInput(this.name,{this.validFun,this.controller,this.onChange,this.hintTxt,
    this.keyboard}){
      print("child input");
    }

  @override
  Widget build(BuildContext context) {
    print("text field build");
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:LocalizedText(
        localizedParentData,name,
                color: HexColor("#f08804"),
                fontSize: 20,
          ) 
          // Text(
          //   this.name,
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //     fontSize: 20,
              
          //   ),
          // ),
        ),
        TextFormField(
          keyboardType:this.keyboard == null? TextInputType.text : this.keyboard,
           controller: this.controller,
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
              hintText: this.hintTxt==null?"write here":this.hintTxt,
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              )),
          validator: this.validFun != null
              ? this.validFun
              : (String value) {
                  if (value.isEmpty) return 'Please enter some text';
                  return null;
                },
                onChanged: onChange,
        ),
      ]),
    );
  }
}
