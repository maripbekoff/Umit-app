import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedSmartAdaptationPage extends StatelessWidget {
  final String _img = 'assets/img/presup/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.asset(
                '${_img}illustration.png',
                width: MediaQuery.of(context).size.width / 1.3,
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    '${_img}winking-smile.png',
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(text: 'Спасибо!\n\n'),
                        TextSpan(
                            text:
                                'Мы адаптировали данное приложение, чтобы вам было удобно пользоваться',
                            style: TextStyle(
                              fontSize: 22,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CupertinoButton(
              color: Color(0xFF0097FF),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Вперед к знаниям!',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
