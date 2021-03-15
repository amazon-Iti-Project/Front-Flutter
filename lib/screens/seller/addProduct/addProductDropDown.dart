import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/categoryCollection-model.dart';
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
//     return AppText("aa");
//   }
// }
/// This is the stateful widget that the main application instantiates.
class AddProductDropDown extends StatefulWidget {
  final String name;
  final String localizedParentData="SellerAdd";
   List<Value> list;
  final String hintTxt;
  final Function onDropChange;
  final Function validFun;
  final String errorText;
  final Value value;
  AddProductDropDown({this.name, this.list, this.hintTxt, this.onDropChange,this.validFun,
  this.errorText,this.value}){
    print("child dropdown constructor");
    // dropdownValue=this.list!=null? this.list[0]:"";
  }
  @override
  _AddProductDropDownState createState() {
    print("create dropdown state");
    return  _AddProductDropDownState();
    }
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddProductDropDownState extends State<AddProductDropDown> {
  

  @override
  void initState() {
    super.initState();
    print("dropdown initstate ${widget.value.toString()}");
    // dropdownValue = this.list[0];
    // print("init done: ${list.length}");

  }

  @override
    void setState(fn) {
      super.setState(fn);
      print("child setState");
    }
  

  @override
  Widget build(BuildContext context) {
    print("value:${widget.value.toString()}");
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
        ),
    
      // drop down starts
        DropdownButtonFormField(

            value: widget.value,
            // validator:widget.validFun(widget.value),
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
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                contentPadding: EdgeInsets.all(8),
                hintText: widget.hintTxt,
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                )),
            onChanged: (Value newValue) {
              widget.onDropChange(newValue);
            },
            items: widget.list.map<DropdownMenuItem<Value>>((Value listItem) {
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
