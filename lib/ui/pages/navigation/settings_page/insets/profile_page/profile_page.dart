import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/ui/pages/navigation/settings_page/insets/profile_page/info_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _cardTitles = [
      "Успеваемость",
      "Пройденные тесы",
      "Оценки",
    ];

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF0679E4),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: ClipPath(
                        clipper: MyFirstClipper(),
                        child: Container(
                          color: Color(0xFF0B5EAC),
                          height: 100,
                          width: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: ClipPath(
                        clipper: MySecondClipper(),
                        child: Container(
                          color: Color(0xFF0B5EAC),
                          height: 100,
                          width: 200,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AppBar(
                          iconTheme: IconThemeData(color: Colors.white),
                          title: Text(
                            "Назад",
                            style: TextStyle(
                              fontSize: appBarTextStyle.fontSize,
                              color: Colors.white,
                            ),
                          ),
                          titleSpacing: 0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 40,
                          child: Image.asset(
                            'assets/img/welcome_page/umit.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: defaultRegularTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: "ФИО\n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "Класс или группа",
                                style: TextStyle(
                                    color: Color(0xFF004A8F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
              child: Text("Статистика", style: defaultBoldTextStyle),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                border: Border.all(
                  width: 2,
                  color: Color(0xFFF0F0F0),
                ),
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return InfoCard(cardTitle: _cardTitles[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
                itemCount: _cardTitles.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 35);
    path.quadraticBezierTo(size.width / 2, 25, size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 45);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MySecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(15, 0);
    path.quadraticBezierTo(size.width / 2, 75, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
