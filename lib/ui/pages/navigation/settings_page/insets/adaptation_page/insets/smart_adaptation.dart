import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';

import 'completed_smart_adaptation_page.dart';

Widget buildSmartAdaptationDialog(BuildContext context) {
  PageController _pageController = PageController();
  int _nextPage = 0;

  var _questionsArray = [
    ["Требуется ли вам голосовой помощник?", null],
    ["Есть ли у вас нарушение слуха?", null],
    ["Имеете ли вы затруднения с чтением текста?", null],
  ];

  void _slideToNextPage(int _nextPage) {
    _pageController.animateToPage(_nextPage,
        duration: Duration(milliseconds: 1), curve: Curves.linear);
  }

  _buildFlatButton(String choice) {
    return FlatButton(
      onPressed: () {
        if (_nextPage <= 2) {
          _slideToNextPage(_nextPage);
        } else {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      CompletedSmartAdaptationPage()));
        }
      },
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "$choice",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  return Dialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 10,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _questionsArray.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius: BorderRadius.circular(360),
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: PageView.builder(
              itemCount: _questionsArray.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                _nextPage = 1 + index;

                return Text(
                  _questionsArray[index][0],
                  style: defaultRegularTextStyle,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFlatButton('Да'),
                SizedBox(width: 30),
                _buildFlatButton('Нет'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
