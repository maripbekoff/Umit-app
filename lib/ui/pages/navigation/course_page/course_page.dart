import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);

  @override
  final bool someCondition = false;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад"),
          titleSpacing: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: "Gilroy",
                  color: Colors.black,
                  fontSize: 32,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Физика ", //переменная с бэка
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "8 класс", //переменная с бэка
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ChapterWidget(),
          ],
        ),
      ),
    );
  }
}

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({Key key}) : super(key: key);
  final int color = 0xFF4CAF50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(color),
              width: 4,
            ),
          ),
          child: FlatButton(
            padding: EdgeInsets.all(4),
            onPressed: () {},
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.check, //получать данные с бэка
                size: 35,
                color: Color(color),
              ),
              backgroundColor: Colors.black12,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "chapter title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(color),
          ),
        )
      ],
    );
  }
}
