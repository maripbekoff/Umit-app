import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key key}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.redAccent,
              ),
              padding: const EdgeInsets.all(2.5),
              child: Icon(
                Icons.functions,
                color: Colors.white,
                size: 28,
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontFamily: "Gilroy"),
                children: <TextSpan>[
                  TextSpan(
                    text: "\nМатематика\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "4 класс",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
