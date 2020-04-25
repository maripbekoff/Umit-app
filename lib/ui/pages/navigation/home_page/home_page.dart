import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/home_page/course_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    onLongPress: () {},
                    hoverColor: Colors.black26,
                    focusColor: Colors.black26,
                    splashColor: Colors.black26,
                    highlightColor: Colors.black26,
                    child: CourseCard(),
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 40,
                      right: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                      color: Color(0xFFFFF5D1),
                    ),
                    child: Row(
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
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 12.5),
                    decoration: BoxDecoration(
                      color: Color(0xFFCAE9FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
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
      ],
    );
  }
}
