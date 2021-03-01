import 'package:flutter/material.dart';

import 'applocalization.dart';

class LocalizedText extends StatelessWidget {
  final String data;
  LocalizedText(this.data);

  @override
  Widget build(BuildContext context) {

      return Text(
        AppLocalizations.of(context).translate(data),
        style: TextStyle(
          fontFamily: 'AmazonFont',
          color: Colors.black,
          fontSize: 20
        ),
      );
    
  }

}