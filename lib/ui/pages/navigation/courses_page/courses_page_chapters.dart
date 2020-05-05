import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/chapters_page/chapter_page.dart';

class CoursesChapterPage extends StatelessWidget {
  DocumentSnapshot snapshot;

  CoursesChapterPage(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: snapshot['lessons'].length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChapterPage(snapshot: snapshot['lessons'][index]), //CourseDescriptionPage(snapshot: snapshot['lessons'][index]),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: Container(
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
            title: Text(
              '${snapshot['lessons'][index]['subject']}',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(thickness: 1, color: Colors.black12);
      },
    );
  }
}
