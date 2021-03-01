import 'package:flutter/widgets.dart';

class SingleItem extends StatelessWidget {
  final String name;
  final String imgSrc;
  SingleItem({this.name,this.imgSrc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.45,
      height: 100,
      child: Center(
        child: Column(
          children: [
            Text(this.name),
            Container(
              width: 100,
              height: 80,
              child: Image.network(this.imgSrc))
          ],
        ),
      ),
      
    );
  }
}