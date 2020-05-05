import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/src/blocs/smartAdaptationBloc/smart_adaptation_bloc.dart';
import 'package:umit/src/blocs/switchBloc/switch_bloc.dart';
import 'package:umit/src/global/text_style.dart';

import 'completed_smart_adaptation_page.dart';

Widget buildSmartAdaptationDialog(BuildContext context) {
  SmartAdaptationBloc smartAdaptationBloc =
      BlocProvider.of<SmartAdaptationBloc>(context);
  SwitchBloc switchBloc = BlocProvider.of<SwitchBloc>(context);

  PageController _pageController = PageController();
  int _nextPage = 0;
  int _currentPage = 0;

  var _questionsArray = [
    "Требуется ли вам голосовой помощник?",
    "Есть ли у вас нарушение слуха?",
    "Имеете ли вы затруднения с чтением текста?",
  ];

  void _slideToNextPage(int _nextPage) {
    _pageController.animateToPage(_nextPage,
        duration: Duration(milliseconds: 1), curve: Curves.linear);
    smartAdaptationBloc.add(SlidedToNextPage(currentPage: _nextPage));
  }

  _buildCurrentPageIndicator(int color) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(360),
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
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BlocBuilder<SmartAdaptationBloc, SmartAdaptationState>(
            builder: (BuildContext context, SmartAdaptationState state) {
              if (state is OpenSettings) {
                return Offstage();
              } else if (state is SwitchThemeState) {
                switchBloc.add(SwitchChanged(isSwitched: state.isSwitched));
                return Offstage();
              }

              if (state is CurrentPageState)
                return Container(
                  height: 10,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _questionsArray.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == state.currentPage) {
                        return _buildCurrentPageIndicator(0xFF0097FF);
                      }
                      return _buildCurrentPageIndicator(0xFFC4C4C4);
                    },
                  ),
                );
            },
          ),
          Flexible(
            child: PageView.builder(
              itemCount: _questionsArray.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) => {
                _currentPage = index,
              },
              itemBuilder: (BuildContext context, int index) {
                _nextPage = 1 + index;

                return Text(
                  _questionsArray[index],
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
                FlatButton(
                  onPressed: () {
                    if (_nextPage <= 2) {
                      _slideToNextPage(_nextPage);
                      debugPrint('$_currentPage');
                      smartAdaptationBloc
                          .add(ButtonPressedYes(questionNumber: _currentPage));
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
                    "Да",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                FlatButton(
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
                    "Нет",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
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
