import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Example(),
    );
  }
}

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
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
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
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Shipped',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text("22 MAY 2020")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
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
                Text("22 MAY 2020")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Arriving By',
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
            Icons.check_circle,
            color: Colors.blue,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.blue,
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
      color: Colors.blue,
      height: 5.0,
      width: 50.0,
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenProgress(
      ticks: 3,
    );
  }
}
