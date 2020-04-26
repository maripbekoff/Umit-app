import 'package:flutter/material.dart';

var settingsArray = [
  ["Данные", Icons.insert_chart],
  ["Уведомленя", Icons.notifications_none],
  ["Адаптация", Icons.invert_colors],
  ["Приватность", Icons.vpn_key],
  ["Безопасность", Icons.security],
  ["Выход", Icons.close],
];

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: Text(
            "Настройки",
            style: TextStyle(fontSize: 50, color: Colors.black),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 6),
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
                  onPressed: () {},
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
            ],
          ),
        ),
      ],
    );
  }
}
