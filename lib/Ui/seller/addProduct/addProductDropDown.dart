import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// This is the stateful widget that the main application instantiates.
class AddProductDropDown extends StatefulWidget {
  @override
  _AddProductDropDownState createState() => _AddProductDropDownState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddProductDropDownState extends State<AddProductDropDown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "choose Category",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              color: HexColor("#f08804"),
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: Icon(Icons.expand_more,),
          iconEnabledColor: HexColor("#232F3E"),
          iconDisabledColor: HexColor("#232F3E"),
          focusColor:HexColor("#f08804"),
          iconSize: 28,
          isExpanded: true,
          elevation: 16,
          style: TextStyle(color: Colors.black, fontSize: 20),
          // underline: Container(
          //   height: 0,
          //   // color: Colors.deepPurpleAccent,
          // ),
          // underline:null,
          decoration:InputDecoration(
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
              contentPadding:EdgeInsets.all(8),
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
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                ));
          }).toList(),
        ),
      ],
    );
  }
}
