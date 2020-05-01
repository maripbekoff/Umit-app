import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> imgs = [
      'assets/img/welcome_page/umit.png',
      'assets/img/welcome_page/umit-app.png',
      'assets/img/welcome_page/hackday2020-logo.png'
    ];

    return Scaffold(
      backgroundColor: Color(0xFF0779E4),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              '${imgs[1]}',
              width: size.width / 2.5,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: <Widget>[
                  Flexible(flex: 1, child: Image.asset('${imgs[0]}')),
                  Spacer(),
                  Flexible(flex: 1, child: Image.asset('${imgs[2]}')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
