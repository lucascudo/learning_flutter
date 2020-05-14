import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[200],
          appBar: AppBar(
            title: Text('I Am Poor'),
            backgroundColor: Colors.orange,
          ),
          body: Center(
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                    child: Image(
                  image: AssetImage('images/flame-payment-processed.png'),
                )),
                WidgetSpan(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      RichText(text: TextSpan(text: 'illustration by ')),
                      RichText(
                          text: TextSpan(
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            decoration: TextDecoration.underline),
                        text: 'Ouch.pics',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url = 'https://icons8.com';
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: false,
                              );
                            }
                          },
                      ))
                    ]))
              ]),
            ),
          ))));
}
//https://icons8.com
