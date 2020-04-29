import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/tests_page/test_card.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int accentCol = 0xFF0097FF;
    int greyCol = 0xFFF0F0F0;
    int whiteCol = 0xFFFFFFFF;

    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Center(
          child: Text(
            "Тестирование",
            style: TextStyle(
              color: Colors.black,
              fontSize: 38,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 9,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              return TestCard(
                iconBack: index == 0 ? accentCol : greyCol,
                iconColor: index == 0 ? whiteCol : accentCol,
              );
            },
          ),
        ),
      ],
    );
  }
}
