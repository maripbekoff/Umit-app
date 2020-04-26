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
        appBar: AppBar(),
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
