import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umit/ui/pages/main_page.dart';
import 'package:umit/ui/pages/navigation/courses_page/courses_page.dart';
import 'package:umit/ui/pages/navigation/home_page/course_card.dart';
import 'package:umit/ui/pages/navigation/home_page/daily_test_card.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firestore firestore = Firestore.instance;

    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: "Gilroy",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: "Привет,\n"),
                TextSpan(
                  text: "${user.displayName}!",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Рекомендуемые курсы',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('Courses').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) return Text('${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      return GridView.builder(
                        padding: EdgeInsets.only(
                          left: 25,
                          top: 10,
                          right: 25,
                          bottom: 40,
                        ),
                        itemCount: snapshot.data.documents.length.clamp(0, 4),
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return CourseCard(
                            snapshot: snapshot.data.documents[index],
                          );
                        },
                      );
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 25,
                      right: 20,
                    ),
                    color: Color(0xFFFFF5D1),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesPage(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.local_library,
                          color: Color(0xFFD9C993),
                        ),
                        Text(
                          "КУРСЫ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                            fontSize: 17,
                            color: Color(0xFFD9C993),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Color(0xFFCAE9FF),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 10.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Icon(
                        Icons.more_horiz,
                        size: 40,
                        color: Color(0xFF0097FF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        DailyTestCard(),
      ],
    );
  }
}
