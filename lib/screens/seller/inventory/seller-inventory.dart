import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/Ui/seller/inventory/seller-inventory-details.dart';

import '../../app-text.dart';

class SellerInventroy extends StatefulWidget {
  @override
  SellerInventoryState createState() => SellerInventoryState();
}

class SellerInventoryState extends State<SellerInventroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>SellerInventroyDetails())
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: HexColor("#f08804"),
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: 150,
                            height: 150,
                            color: Colors.grey[200],
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Image.network(
                                "https://picsum.photos/200/800",
                              ),
                            ),
                          ),
                        ),
                        // CircleAvatar(
                        //   backgroundColor: HexColor("#f08804"),
                        //   radius: 50,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(50),
                        //     child: Image.network(
                        //       "https://picsum.photos/200/300",
                        //       width: 100,
                        //       height: 100,
                        //     ),
                        //   ),
                        // ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: AppText(
                                          "Camera 1 that it`s brand is huawaui and it`s size is 2.3 in. x 3.4 in.",
                                          bold: true,
                                          maxLines: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                               AppText(
                                              "\$ ",
                                              fontSize:12,
                                            ),
                                            AppText(
                                              "120 ",
                                              subText: true,
                                            ),
                                          ],
                                        )),
                                    (true
                                        ? Flexible(
                                            fit: FlexFit.loose,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: AppText(
                                                "\$130 ",
                                                color: Colors.grey,
                                                lineThrough: true,
                                                subText: true,
                                              ),
                                            ),
                                          )
                                        : Text('')),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: AppText(
                                        "Quantity: 16",
                                        subText: true,
                                      ),
                                    )
                                  ],
                                ),
                                Row(children: [
                                 Icon(Icons.star_rate,color:true?Colors.yellow[800]:Colors.grey[400]) ,
                                 Icon(Icons.star_rate,color:true?Colors.yellow[800]:Colors.grey[400]) ,
                                 Icon(Icons.star_rate,color:true?Colors.yellow[800]:Colors.grey[400]) ,
                                 Icon(Icons.star_rate,color:false?Colors.yellow[800]:Colors.grey[400]) ,
                                 Icon(Icons.star_rate,color:false?Colors.yellow[800]:Colors.grey[400]) ,
                                ],)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
