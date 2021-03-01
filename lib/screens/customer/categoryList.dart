import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/screens/product_detalis_screen.dart';
import 'package:project/widgets/appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../applocalization.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AmazonAppBar(),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[400]))),
            child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8.0),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context).translate('delivery')),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context).translate('CompAccessories')),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context).translate('category')),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0,top:8.0),
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context).translate('results')
                        ,style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetailsScreen()
                    ));
                  },
                                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      elevation: 0.0,
                      semanticContainer: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            child: Image.network('https://i01.appmifile.com/webfile/globalimg/in/cms/4BAADF0B-B0D8-D9C3-1D38-43BAB1F76080.jpg'),
                          ),
                          Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Laptop",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                RatingBar.builder(
                                  itemSize: 16,
                                  initialRating: 4.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Row(
                                  children: [
                                    Text("\$59.99",style: TextStyle(
                                      fontSize: 18,
                                    )),
                                    Text('\$62.99',style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                    ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 0.0,
                    semanticContainer: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.network('https://i01.appmifile.com/webfile/globalimg/in/cms/4BAADF0B-B0D8-D9C3-1D38-43BAB1F76080.jpg'),
                        ),
                        Container(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Laptop",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                              RatingBar.builder(
                                itemSize: 16,
                                initialRating: 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Row(
                                children: [
                                  Text("\$59.99",style: TextStyle(
                                    fontSize: 18,
                                  )),
                                  Text('\$62.99',style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough
                                  ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
