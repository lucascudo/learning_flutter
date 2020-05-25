import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    Magic8Ball(),
  );
}

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballNumber;

  _Magic8BallState() {
    randomizeBall();
  }

  void randomizeBall() {
    ballNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ask Me Everything'),
          backgroundColor: Color(0xff3158ab),
        ),
        body: SafeArea(
          child: Container(
              color: Color(0xff4ca2f5),
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      randomizeBall();
                    });
                  },
                  child: Image.asset('images/ball$ballNumber.png'),
                ),
              )),
        ),
      ),
    );
  }
}
