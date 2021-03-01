import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/services/Localization/applocalization.dart';

class NineSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0,bottom: 8.0),
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context).translate('bestSellElect'),
                          style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            color: Colors.grey[200],
                            child: Image.network('https://www.apple.com/v/macos/photos/f/images/meta/og__fn0yxd063t6q.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            color: Colors.grey[200],
                            child: Image.network('https://i.pinimg.com/originals/3b/59/c3/3b59c3bb24b03a90d9c09a88079607ba.png'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            color: Colors.grey[200],
                            child: Image.network('http://www.pngmart.com/files/1/Haier-TV-PNG.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            color: Colors.grey[200],
                            child: Image.network('https://www.apple.com/v/macos/photos/f/images/meta/og__fn0yxd063t6q.png'),
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),
              ],
            ),
          ),
        ));
  }
}
