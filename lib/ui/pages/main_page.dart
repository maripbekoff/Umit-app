import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/logOutBloc/bloc.dart';
import 'package:umit/ui/pages/navigation/favorite_page.dart';
import 'package:umit/ui/pages/navigation/home_page/home_page.dart';
import 'package:umit/ui/pages/navigation/settings_page/settings.page.dart';
import 'package:umit/ui/pages/navigation/tests_page/tests_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, @required this.userRepository}) : super(key: key);

  UserRepository userRepository;
  LogOutBloc logOutBloc;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  static UserRepository userRepository;

  List<Widget> _widgetOptions = <Widget>[
    FavoritePage(),
    TestsPage(),
    HomePage(),
    SettingsPageParent(userRepository: userRepository,),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //функция скрытия иконки профиля в AppBar при переключении на влкадку настроек
  _actionHide() {
    if (_selectedIndex == 3) {
      return null;
    } else
      return <Widget>[
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 3,
            ),
          ),
          child: FlatButton(
            padding: const EdgeInsets.all(3),
            onPressed: () {},
            shape: CircleBorder(),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 32,
                color: Colors.white,
              ),
              backgroundColor: Colors.black26,
            ),
          ),
        ),
        SizedBox(width: 9),
      ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.dehaze),
              color: Colors.black,
              iconSize: 40,
              onPressed: () {},
            ),
            actions: _actionHide(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.black26,
            iconSize: 38,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Понравки'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.extension),
                title: Text('Тестирование'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Главная'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Настройки'),
              ),
            ],
          ),
          body: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
