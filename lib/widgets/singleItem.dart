import 'package:flutter/widgets.dart';

class SingleItem extends StatelessWidget {
  final String name;
  final String imgSrc;
  SingleItem({this.name,this.imgSrc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.45,
      height: 200,
      child: Center(
        child: Column(
          children: [
            Text(this.name,style: TextStyle(fontSize: 16),),
            Container(
              width: 120,
              height: 120,
              child: Image.network(this.imgSrc))
          ],
        ),
      ),
      
    );
  }
}