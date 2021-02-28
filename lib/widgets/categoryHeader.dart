import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryHeader extends StatelessWidget {
  final String title;
  final String description;
  CategoryHeader({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2.0, color: Colors.grey[100]),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(this.title,style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold)),
              Text(this.description,style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
    );
  }
}