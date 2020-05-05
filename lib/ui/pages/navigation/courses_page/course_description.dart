import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/ui/pages/main_page.dart';

class CourseDescriptionPage extends StatelessWidget {
  DocumentSnapshot snapshot;
  Firestore firestore = Firestore.instance;
  String documentId;
  String userId;

  CourseDescriptionPage({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    documentId = snapshot.documentID;
    userId = user.uid;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text("Назад", style: appBarTextStyle),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Center(
              child: Text(
                '${snapshot['name']}',
                style: titleTextStyle,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Описание курса\n\n",
                            style: TextStyle(
                              fontFamily: defaultRegularTextStyle.fontFamily,
                              color: Colors.black,
                              fontSize: defaultRegularTextStyle.fontSize + 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${snapshot['description']}',
                            style: defaultRegularTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ExpansionTile(
                      title: Text(
                        "Содержание",
                        style: TextStyle(
                          fontFamily: defaultRegularTextStyle.fontFamily,
                          color: Colors.black,
                          fontSize: defaultRegularTextStyle.fontSize + 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        ListView.separated(
                          itemCount: snapshot['lessons'].length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                "${1 + index} урок. ${snapshot['lessons'][index]['subject']}",
                                style: defaultRegularTextStyle,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(thickness: 2, color: Colors.black12);
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12, thickness: 2),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: FlatButton(
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          firestore
                              .collection('Users')
                              .document('$userId')
                              .updateData(
                            {
                              'courses': [
                                {
                                  'cid': '$documentId',
                                  'lastLesson': '0',
                                  'complete': false,
                                }
                              ]
                            },
                          );
                        },
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Начать курс",
                          style: TextStyle(
                            fontSize: defaultBoldTextStyle.fontSize + 4,
                            color: Colors.white,
                            fontFamily: defaultBoldTextStyle.fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
