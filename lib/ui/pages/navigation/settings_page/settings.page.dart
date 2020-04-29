import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/logOutBloc/bloc.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/navigation/settings_page/insets/adaptation_page.dart';

var settingsArray = [
  ["Данные", Icons.insert_chart, null],
  ["Уведомленя", Icons.notifications_none, null],
  ["Адаптация", Icons.invert_colors, AdaptationPage()],
  ["Приватность", Icons.vpn_key, null],
  ["Безопасность", Icons.security, null],
  ["Выход", Icons.close, null],
];

class SettingsPageParent extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LogOutBloc(userRepository: userRepository),
      child: SettingsPage(userRepository: userRepository),
    );
  }
}

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key, @required this.userRepository}) : super(key: key);

  UserRepository userRepository;
  LogOutBloc logOutBloc;

  @override
  Widget build(BuildContext context) {
    logOutBloc = BlocProvider.of<LogOutBloc>(context);
    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Center(
          child: Text(
            "Настройки",
            style: TextStyle(fontSize: 38, color: Colors.black),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.all(20),
                primary: false,
                shrinkWrap: true,
                itemCount: settingsArray.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  return FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => settingsArray[index][2],
                        ),
                      );
                    },
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
                          settingsArray[index][1],
                          color: Theme.of(context).accentColor,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        settingsArray[index][0],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    logOutBloc.add(LogOutButtonPressedEvent());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 67, 54, 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        settingsArray[5][1],
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      settingsArray[5][0],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              BlocListener<LogOutBloc, LogOutState>(
                listener: (context, state) {
                  if (state is LogOutSuccess) {
                    navigateToLogInPage(context);
                  }
                },
                child: BlocBuilder<LogOutBloc, LogOutState>(
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
      ],
    );
  }

  void navigateToLogInPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPageParent(userRepository: userRepository);
    }));
  }
}
