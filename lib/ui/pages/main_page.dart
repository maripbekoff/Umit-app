import 'package:flutter/material.dart';
import 'package:umit/ui/pages/navigation/favorite_page.dart';
import 'package:umit/ui/pages/navigation/home_page/home_page.dart';
import 'package:umit/ui/pages/navigation/settings.page.dart';
import 'package:umit/ui/pages/navigation/tests_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    FavoritePage(),
    TestsPage(),
    HomePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.dehaze),
              iconSize: 40,
              color: Colors.black,
              onPressed: () {},
            ),
            actions: <Widget>[
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
            ],
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
