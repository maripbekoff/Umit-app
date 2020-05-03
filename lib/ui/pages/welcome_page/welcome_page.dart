import 'package:flutter/material.dart';
import 'package:umit/ui/pages/welcome_page/pages.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: _controller,
        children: <Widget>[
          WelcomePageOne(),
          WelcomePageTwo(),
          WelcomePageThree(),
        ],
      ),
    );
  }
}
