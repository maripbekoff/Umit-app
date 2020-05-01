import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';

class AdaptationPage extends StatelessWidget {
  const AdaptationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад"),
          titleSpacing: 0,
          textTheme: TextTheme(title: appBarTextStyle),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Text("Адаптация", style: titleTextStyle),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
