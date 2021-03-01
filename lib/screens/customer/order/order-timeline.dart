import 'package:flutter/material.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: <Widget>[
            tick1(),
            spacer(),
            new RotatedBox(quarterTurns: 1, child: line()),
            spacer(),
            tick2(),
            spacer(),
            new RotatedBox(quarterTurns: 1, child: line()),
            spacer(),
            tick3(),
            spacer(),
            new RotatedBox(quarterTurns: 1, child: line()),
            spacer(),
            tick4(),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 1, top: 25, bottom: 25, right: 5),
                  child: Text(
                    'Ordered',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text("22 MAY 2020")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 1, top: 25, bottom: 25, right: 5),
                  child: Text(
                    'Shipped',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text("22 MAY 2020")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, top: 25, bottom: 25, right: 5),
                  child: Row(
                    children: [
                      Text(
                        'Out For Delivery',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Text(" 22 MAY 2020")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 1, top: 25, bottom: 25, right: 5),
                  child: Text(
                    ' Arriving By',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text("22 MAY 2020")
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_box,
            color: Color.fromRGBO(133, 217, 225, 1),
          )
        : Icon(
            Icons.check_box_outline_blank,
            color: Color.fromRGBO(133, 217, 225, 1),
          );
  }

  Widget tick1() {
    return this.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return this.ticks > 3 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return Container(
      width: 5.0,
    );
  }

  Widget line() {
    return Container(
      color: Color.fromRGBO(133, 217, 225, 1),
      height: 5.0,
      width: 50.0,
    );
  }
}
