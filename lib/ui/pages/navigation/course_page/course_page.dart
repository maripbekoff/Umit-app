import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final bool someCondition = false;
  final DocumentSnapshot snapshot;

  CoursePage({Key key, @required this.snapshot}) : super(key: key);

  @override
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
            Text(
              "${snapshot["name"]}",
              style: TextStyle(
                fontFamily: "Gilroy",
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 20),
            ChapterWidget(snapshot: snapshot),
          ],
        ),
      ),
    );
  }
}

class ChapterWidget extends StatelessWidget {
  final int color = 0xFF4CAF50;
  final DocumentSnapshot snapshot;

  const ChapterWidget({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot["lessons"].length,
      itemBuilder: (BuildContext context, int index) {
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
              "${snapshot["lessons"][index]["subject"]}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(color),
              ),
            )
          ],
        );
      }
    );
  }
}
