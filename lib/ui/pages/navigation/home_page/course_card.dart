import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/chapters_page/chapter_list_page.dart';

class CourseCard extends StatelessWidget {
  CourseCard({Key key, this.snapshot}) : super(key: key);

  final DocumentSnapshot snapshot;

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChapterListPage(snapshot: snapshot),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                padding: const EdgeInsets.all(2.5),
                child: Icon(
                  Icons.functions,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontFamily: "Gilroy"),
                    children: <TextSpan>[
                      TextSpan(
                        text: "${snapshot["name"]}\n",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "${snapshot["description"]}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
