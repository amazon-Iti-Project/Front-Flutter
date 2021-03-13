import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/product-model.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';
import 'package:project/services/productService.dart';

class SellerInventroyDetails extends StatefulWidget {
  num prodId;
  SellerInventroyDetails({this.prodId = 1});
  @override
  SellerInventroyDetailsState createState() => SellerInventroyDetailsState();
}

class SellerInventroyDetailsState extends State<SellerInventroyDetails> {
  String localizedParentData = "SellerInventory";
  Future<Product> futureProduct;
  String langCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    langCode='en';
    ProductService prodServ = ProductService();
    futureProduct = prodServ.getProductByID(widget.prodId);
    // prodServ.getProductsBySellerId(1).then(
    //   (res)=>{
    //     this.productList = res,
    //     print("testedProd: ${res[0].toString()}")
    //     }
    // ).catchError(
    //   (e)=>print(e)
    // );
  }
  // @override
  // void didChangeDependencies() {
  //   Locale myLocale = Localizations.localeOf(context);
  //   setState(() {
  //     langCode =  myLocale.languageCode;      
  //   });
  //   super.didChangeDependencies();
  // }

  num getNetPrice(Product product) {
    return product.price * ((100-product.discount) / 100) * ((100-product.fee.fee) / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: LocalizedText(
          localizedParentData,
          'inventory',
          color: Colors.white,
          bold: true,
        ),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: FutureBuilder<Product>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data;
            return Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: HexColor("#f08804"),
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            LocalizedText(
                              localizedParentData,
                              "brand",
                              color: Colors.lightBlue[700],
                              subText: true,
                            ),
                            AppText(
                              ":${product.brand}",
                              color: Colors.lightBlue[700],
                              subText: true,
                            ),
                          ],
                        ),
                        //rating
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate,
                              color:
                                  true ? Colors.yellow[800] : Colors.grey[400],
                              size: 20,
                            ),
                            Icon(
                              Icons.star_rate,
                              color:
                                  true ? Colors.yellow[800] : Colors.grey[400],
                              size: 20,
                            ),
                            Icon(
                              Icons.star_rate,
                              color:
                                  true ? Colors.yellow[800] : Colors.grey[400],
                              size: 20,
                            ),
                            Icon(
                              Icons.star_rate,
                              color:
                                  false ? Colors.yellow[800] : Colors.grey[400],
                              size: 20,
                            ),
                            Icon(
                              Icons.star_rate,
                              color:
                                  false ? Colors.yellow[800] : Colors.grey[400],
                              size: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: AppText(
                            "${product.description}",
                            maxLines: 10,
                            color: Colors.grey[800],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // padding: EdgeInsets.all(8.0),
                        width: double.infinity,
                        constraints:
                            BoxConstraints(maxHeight: 300, minHeight: 300),
                        color: Colors.grey[200],
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image.network(
                            product.image,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LocalizedText(localizedParentData, "quantity"),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: AppText(
                                    "${product.quantity}",
                                    subText: true,
                                  ),
                                )
                              ],
                            ), //quantity
                            Divider(
                              height: 10,
                              thickness: 1,
                              color: Colors.grey,
                              indent: 25,
                              endIndent: 25,
                            ),
                            LocalizedText(
                              localizedParentData,
                              "offerAndFeeDetails",
                              bold: true,
                            ),

                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    side: BorderSide(color: Colors.grey[700])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                              localizedParentData, "price"),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                  fit: FlexFit.loose,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppText(
                                                        "\$ ",
                                                        fontSize: 12,
                                                      ),
                                                      AppText(
                                                        "${product.price}",
                                                        bold: true,
                                                        subText: true,
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                              localizedParentData, "discount"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "%",
                                                fontSize: 12,
                                              ),
                                              AppText("${product.discount}"),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(localizedParentData,
                                              "fees"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "%",
                                                fontSize: 12,
                                              ),
                                              AppText(
                                              "${product.fee.fee}"),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(localizedParentData,
                                              "returnPrice"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "\$",
                                                fontSize: 12,
                                              ),
                                              AppText(
                                                  "${getNetPrice(product).ceilToDouble()}"),
                                            ],
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 10,
                                        thickness: 1,
                                        color: Colors.grey,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                            localizedParentData,
                                            "netReturn",
                                            color: Colors.lightBlue[700],
                                            bold: true,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "\$",
                                                fontSize: 12,
                                              ),
                                              AppText("${getNetPrice(product).ceilToDouble()}",
                                            bold: true,
                                              
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )), //price

                            LocalizedText(
                              localizedParentData,
                              "shipmentDetails",
                              bold: true,
                            ),

                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    side: BorderSide(color: Colors.grey[700])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                              localizedParentData, "shipment"),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                  fit: FlexFit.loose,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppText(
                                                        "\$ ",
                                                        fontSize: 12,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: AppText(
                                                          "${product.shipping.shipPrice}",
                                                          subText: true,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                              localizedParentData, "period"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              LocalizedText(
                                                localizedParentData,
                                                "day",
                                                fontSize: 12,
                                              ),
                                              AppText(
                                                "${product.shipping.period}",
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 10,
                                        thickness: 1,
                                        color: Colors.grey,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LocalizedText(
                                            localizedParentData,
                                            "netReturn",
                                            color: Colors.lightBlue[700],
                                            bold: true,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                "\$",
                                                fontSize: 12,
                                                bold: true,
                                              ),
                                              AppText(
                                                "${product.shipping.shipPrice}",
                                                bold: true,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )), //price

                            LocalizedText(
                              localizedParentData,
                              "orderDetails",
                              bold: true,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  side: BorderSide(color: Colors.grey[700])),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocalizedText(localizedParentData,
                                            "numberOfOrders"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "",
                                              fontSize: 12,
                                            ),
                                            AppText("12"),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocalizedText(localizedParentData,
                                            "ordersReturn"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "\$",
                                              fontSize: 12,
                                            ),
                                            AppText("12"),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocalizedText(localizedParentData,
                                            "shippedOrders"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "",
                                              fontSize: 12,
                                            ),
                                            AppText("12"),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                      thickness: 1,
                                      color: Colors.grey,
                                      indent: 25,
                                      endIndent: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocalizedText(
                                          localizedParentData,
                                          "totalReturn",
                                          color: Colors.lightBlue[700],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "\$",
                                              fontSize: 12,
                                            ),
                                            AppText("12"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          
          } else {
            Widget w = snapshot.hasError
                ? AppText("error")
                : Center(child: CircularProgressIndicator());
            return w;
          }
        },
      ),
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
