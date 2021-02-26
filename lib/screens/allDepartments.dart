import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/screens/category.dart';

import '../applocalization.dart';

class AllDepartments extends StatelessWidget {
  var depList = <String>["Prime Video",'Music,CDs & Vinyl','Digital Music','Kindle Store','Arts & Crafts','Automotive','Baby','Beauty & Personal Care','Books','Computers','Electronics',"Women's Fashion","Gil's Fashion","Men's Fashion"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Container(
            width: 100,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset('Images/amazon-black.png'),
            )),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: Colors.black, size: 28),
              onPressed: null),
        ],
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(133, 217, 225, 1),
                Color.fromRGBO(165, 230, 206, 1)
              ])),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
                child: Text(AppLocalizations.of(context).translate('earthBigSelection'),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.79,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[300])
                
              ),
              child: ListView.builder(
                itemCount: depList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Category()
                        ));
                      },
                      title: Text(depList[index]),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 14,),
                    ),
                    decoration: BoxDecoration(
                      border: new Border(
                        bottom: new BorderSide(color: Colors.grey[300])
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}