import 'package:flutter/material.dart';
import 'package:project/services/Localization/applocalization.dart';

class LocalizedText extends StatelessWidget {
  final String parentData;
  final String childData;
  final Color color;
  final bool bold;
  final bool subText;
  final int maxLines;
  final bool lineThrough;
  final double fontSize;
  final TextAlign textAlign;
  LocalizedText(this.parentData,this.childData,
      {this.color,
      this.textAlign,
      this.bold = false,
      this.fontSize = 20,
      this.subText = false,
      this.maxLines = 1,
      this.lineThrough = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translateNested(parentData,childData),
      maxLines:maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign:textAlign !=null? textAlign : TextAlign.start ,
        style: TextStyle(
          decoration: lineThrough? TextDecoration.lineThrough:TextDecoration.none,
          fontFamily: 'AmazonFont',
          color: this.color!=null? this.color:Colors.black,
          fontSize:this.subText? 18:fontSize,
          fontWeight:this.bold? FontWeight.bold: FontWeight.normal
        )
    );
  }
}
