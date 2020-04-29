import 'package:flutter/material.dart';

class AdaptationPage extends StatefulWidget {
  AdaptationPage({Key key}) : super(key: key);

  @override
  _AdaptationPageState createState() => _AdaptationPageState();
}

class _AdaptationPageState extends State<AdaptationPage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад"),
          titleSpacing: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: SwitchListTile(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            title: Text("TEST"),
          ),
        ),
      ),
    );
  }
}
