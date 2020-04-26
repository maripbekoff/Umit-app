import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_bloc.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_state.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/settings_page.dart';

class HomePageParent extends StatelessWidget {
  FirebaseUser user;
  UserRepository userRepository;

  HomePageParent({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(userRepository: userRepository),
      child: HomePage(user: user, userRepository: userRepository),
    );
  }
}

class HomePage extends StatelessWidget {
  FirebaseUser user;
  HomePageBloc homePageBloc;
  UserRepository userRepository;

  HomePage({@required this.user, @required this.userRepository});

  int _index = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Text("1"),
    Text("2"),
    Text("3"),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {}

    homePageBloc = BlocProvider.of<HomePageBloc>(context);
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
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
              ),
              SizedBox(width: 10)
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: _widgetOptions[3],
              ),
              BlocListener<HomePageBloc, HomePageState>(
                listener: (context, state) {
                  if (state is LogOutSuccess) {
                    navigateToLogInPage(context);
                  }
                },
                child: BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is LogOutInitial) {
                      return Container();
                    } else if (state is LogOutSuccess) {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLogInPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPageParent(userRepository: userRepository);
    }));
  }
}
