import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/home_page/course_card.dart';
import 'package:umit/ui/pages/navigation/home_page/daily_test_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: "Gilroy",
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: "Привет,\n"),
                TextSpan(
                  text: "Username!",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
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
              GridView.builder(
                padding: EdgeInsets.only(
                  left: 25,
                  top: 25,
                  right: 25,
                  bottom: 40,
                ),
                itemCount: 4,
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CourseCard();
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 40,
                      right: 30,
                    ),
                    color: Color(0xFFFFF5D1),
                    onPressed: () {},
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
                            fontSize: 18,
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
                        EdgeInsets.symmetric(horizontal: 25, vertical: 12.5),
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
