import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/ui/pages/navigation/courses_page/course_description.dart';
import 'package:umit/ui/pages/navigation/courses_page/courses_page_chapters.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firestore firestore = Firestore.instance;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад", style: appBarTextStyle),
          titleSpacing: 0,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Courses').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                return ListView.separated(
                  itemCount: snapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        "${snapshot.data.documents[index]['name']}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CourseDescriptionPage(snapshot: snapshot.data.documents[index],)));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(thickness: 1, color: Colors.black12);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
