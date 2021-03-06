import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/categoryCollection.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';


// class AddProductDropDown extends StatelessWidget {
//    String name;
//    List<Value> list;
//   Value dropdownValue;
//   final String hintTxt;
//   final Function onDropChange;
//   AddProductDropDown({this.name, this.list, this.hintTxt, this.onDropChange}){
//     print("child");
//     // dropdownValue=this.list!=null? this.list[0]:"";
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return AppText("aa");
//   }
// }
/// This is the stateful widget that the main application instantiates.
class AddProductDropDown extends StatefulWidget {
  final String name;
  final String localizedParentData="SellerAdd";
   List<Value> list;
  Value dropdownValue;
  final String hintTxt;
  final Function onDropChange;
  final Function validFun;
  final String errorText;
  AddProductDropDown({this.name, this.list, this.hintTxt, this.onDropChange,this.validFun,this.errorText}){
    print("child");
    // dropdownValue=this.list!=null? this.list[0]:"";
  }
  @override
  _AddProductDropDownState createState() {
    print("create state");
    return  _AddProductDropDownState();
    }
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddProductDropDownState extends State<AddProductDropDown> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    // dropdownValue = this.list[0];
    // print("init done: ${list.length}");

  }

  @override
    void setState(fn) {
      // TODO: implement setState
      super.setState(fn);
      print("child setState");
    }
  

  @override
  Widget build(BuildContext context) {
    // print("build done: ${list.length}");
    //   this.list = widget.list;
    // dropdownValue = this.list[0];
    // print("dropdown: ${dropdownValue}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:LocalizedText(
                widget.localizedParentData,widget.name,
                fontSize: 20,
                color: HexColor("#f08804"),
          ) 
          // Text(
          //   widget.name,
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: HexColor("#f08804"),
          //   ),
          // ),
        ),
        DropdownButtonFormField(

            value: widget.dropdownValue,
            validator:widget.validFun(widget.dropdownValue),
            icon: Icon(
              Icons.expand_more,
            ),
            iconEnabledColor: HexColor("#232F3E"),
            iconDisabledColor: HexColor("#232F3E"),
            focusColor: HexColor("#f08804"),
            iconSize: 28,
            isExpanded: true,
            elevation: 16,
            style: TextStyle(color: Colors.black, fontSize: 20),
            // underline: Container(
            //   height: 0,
            //   // color: Colors.deepPurpleAccent,
            // ),
            // underline:null,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorText:widget.errorText,
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: HexColor("#f08804"), width: 1),
                //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: HexColor("#232F3E"), width: 1),
                //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // ),
                // disabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: HexColor("#232F3E"), width: 1),
                //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // ),
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
                hintText: widget.hintTxt,
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                )),
            onChanged: (Value newValue) {
              widget.onDropChange(newValue);
              setState(() {
                widget.dropdownValue = newValue;
              });
            },
            items: widget.list.map<DropdownMenuItem<Value>>((Value listItem) {
              // print("listItem: $listItem");
              return DropdownMenuItem<Value>(
                  key: UniqueKey(),
                  value: listItem,
                  child: Text(
                    listItem.value == null ? "not found" : listItem.value,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  ));
            }).toList())
      ],
    );
  }
}
