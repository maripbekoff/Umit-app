import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';

Widget buildSmartAdaptationTile(BuildContext context) {
  return FlatButton(
    padding: EdgeInsets.zero,
    onPressed: () {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(3, 169, 244, 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.insert_chart,
          color: Theme.of(context).accentColor,
          size: 20,
        ),
      ),
      title: Text(
        "Умная адаптация",
        style: defaultRegularTextStyle,
      ),
    ),
  );
}

Widget buildColorSettingsExpansionTile(BuildContext context) {
  List<Color> _themeColors = [
    Color(0xFF0097FF),
    Color(0xFFFF6D62),
    Color(0xFF4CAF50),
  ];

  bool _currentValue = false;

  int _currentIndex = 2;
  Widget _currentThemeIndicator = Positioned(
    right: -2,
    top: -2,
    child: Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
    ),
  );

  Widget _checkCurrentTheme(int index) {
    if (_currentIndex == index)
      return _currentThemeIndicator;
    else
      return SizedBox(); //если поставить null выдаст ошибку, в stack не может быть null
  }

  return ExpansionTile(
    leading: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(3, 169, 244, 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.palette,
        color: Theme.of(context).accentColor,
        size: 20,
      ),
    ),
    title: Text("Настройка цвета", style: defaultRegularTextStyle),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ListView.builder(
            itemExtent: 50,
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemCount: _themeColors.length,
            itemBuilder: (BuildContext context, int index) {
              return FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            color: _themeColors[index],
                          ),
                        ),
                        _checkCurrentTheme(index),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                        color: Color(0xFFF0F0F0),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      SwitchListTile(
        value: _currentValue,
        onChanged: (bool value) {
          _currentValue = value;
        },
        title: Text(
          "Контрастность",
          style: defaultRegularTextStyle,
        ),
      ),
    ],
  );
}

Widget buildVoiceoverSwitchListTile(BuildContext context) {
  bool _currentValue = false;

  return SwitchListTile(
    value: _currentValue,
    onChanged: (bool value) {
      _currentValue = value;
    },
    title: Text(
      "Talkback/Voiceover",
      style: defaultRegularTextStyle,
    ),
  );
}

Widget buildSubtitlesSwitchListTile(BuildContext context) {
  bool _currentValue = false;

  return SwitchListTile(
    value: _currentValue,
    onChanged: (bool value) {
      _currentValue = value;
    },
    title: Text(
      "Субтитры",
      style: defaultRegularTextStyle,
    ),
  );
}

Widget buildFontSizeSlider(BuildContext context) {
  double _currentValue = 12;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      ListTile(
        title: Text("Размер шрифта:", style: defaultRegularTextStyle),
      ),
      Slider(
        min: 12,
        max: 24,
        value: _currentValue,
        onChanged: (double value) {
          _currentValue = value;
        },
        divisions: 2,
        label: "$_currentValue",
      ),
    ],
  );
}
