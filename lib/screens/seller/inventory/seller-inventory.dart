import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/models/product-model.dart';
import 'package:project/screens/seller/inventory/seller-inventory-details.dart';
import 'package:project/screens/templatesWidgets/app-text.dart';
import 'package:project/screens/templatesWidgets/localized-text.dart';
import 'package:project/services/productService.dart';

class SellerInventroy extends StatefulWidget {
  @override
  SellerInventoryState createState() => SellerInventoryState();
}

class SellerInventoryState extends State<SellerInventroy> {
  String localizedParentData = "SellerInventory";
  Future<List<Product>> futureProductList;
  String langCode;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      langCode = 'en';
      ProductService prodServ = ProductService();
      futureProductList =prodServ.getProductsBySellerId(1);
      // prodServ.getProductsBySellerId(1).then(
      //   (res)=>{
      //     this.productList = res,
      //     print("testedProd: ${res[0].toString()}")
      //     }
      // ).catchError(
      //   (e)=>print(e)
      // );
    }
    @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    setState(() {
      langCode =  myLocale.languageCode;      
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:  LocalizedText(localizedParentData,'inventory',color: Colors.white,bold: true,),
        backgroundColor: HexColor("#232F3E"),
      ),
      body: FutureBuilder<List<Product>>(
      future: futureProductList,
      builder: (context,snapshot){
        if(snapshot.hasData){
          final productList = snapshot.data;
          return ListView.builder(
            itemCount:productList.length,
            itemBuilder:(context,index){
              final product = productList[index];
           
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>SellerInventroyDetails(prodId:product.id))
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
                                product.image,
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
                                          "${product.description}",
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
                                              product.price.toString(),
                                              subText: true,
                                            ),
                                          ],
                                        )),
                                    (product.discount !=null
                                        ? Flexible(
                                            fit: FlexFit.loose,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: AppText(
                                                "\$${product.price*(product.discount/100)}",
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
                                      child: Row(
                                        children: [
                                          LocalizedText(
                                            localizedParentData,
                                            "quantity",
                                            subText: true,
                                          ),
                                           AppText(
                                            "${product.quantity}",
                                            subText: true,
                                          ),
                                        ],
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
                
            }
          );
       
        }else{
          Widget w =snapshot.hasError ? AppText("error: ${snapshot.error}")       
          :
         Center(child: CircularProgressIndicator());     
         return w;
        }
      },
      ),
    );
    //  AppLocalizations.of(context).translate('shopbydep')
  }
}
