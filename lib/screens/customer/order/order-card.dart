import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  String text;
  OrderCard({this.text});
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.network('https://picsum.photos/150/150'),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(9.0),
              //   child: Text(widget.text),
              // ),
              Row(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(9.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [Icon(Icons.thumb_up), Text(" Like")],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(9.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [Icon(Icons.comment), Text(" Comment")],
                  //   ),
                  // ),
                  Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
