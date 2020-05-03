import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';

class IntoTestPage extends StatefulWidget {
  IntoTestPage({Key key}) : super(key: key);

  @override
  _IntoTestPageState createState() => _IntoTestPageState();
}

class _IntoTestPageState extends State<IntoTestPage> {
  String _buttonText = "Пропустить";
  int _optionsSum = 6;
  int _groupValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад"),
          titleSpacing: 0,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Text(
                "Тест по физике", //получать переменную с бэка
                style: titleTextStyle,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "\$question",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  // ListView.builder(
                  //   padding: EdgeInsets.all(20),
                  //   primary: false,
                  //   shrinkWrap: true,
                  //   itemCount: _optionsSum,
                  //   itemBuilder: (BuildContext context, index) {
                  //     return ListTile(
                  //       leading: Radio(
                  //         value: index,
                  //         groupValue: _groupValue,
                  //         onChanged: (index) {
                  //           return;
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  FlatButton(
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    textTheme: ButtonTextTheme.normal,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _buttonText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
