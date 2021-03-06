import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  String status;
  String imgSrc;
  String orderName;
  OrderCard({this.status, this.imgSrc, this.orderName});
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
                child: Image.network(widget.imgSrc, height: 100, width: 100),
              ),
              Column(
                children: [
                  SizedBox(
                      width: 200.0,
                      child: Text(widget.orderName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          overflow: TextOverflow.ellipsis)),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.status,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green,
                            ),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
