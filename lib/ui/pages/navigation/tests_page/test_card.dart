import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/tests_page/tests_page.dart';

class TestCard extends StatelessWidget {
  const TestCard({Key key, this.iconBack, this.iconColor}) : super(key: key);
  final int iconBack, iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
            offset: Offset(10, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(iconBack),
                    ),
                    padding: const EdgeInsets.all(2.5),
                    child: Icon(
                      Icons.functions,
                      color: Color(iconColor),
                      size: 24,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  RichText(
                    text: TextSpan(
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Gilroy"),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Тест по математике\n", //переменные с сервера
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              "Неопределённые интегралы", //переменные с сервера
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: Color(iconBack),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Icon(
                  Icons.play_arrow, //переменные с сервера
                  color: Color(iconColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
