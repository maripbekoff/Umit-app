import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/src/blocs/themeBloc/bloc.dart';
import 'package:umit/src/global/themes.dart';

class AdaptationPage extends StatelessWidget {
  bool _isSwitched = false;
  ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    themeBloc = BlocProvider.of<ThemeBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Назад"),
          titleSpacing: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: AppTheme.values.length,
            itemBuilder: (BuildContext context, int index) {
              final itemTheme = AppTheme.values[index];
              return Card(
                color: themeData[itemTheme].primaryColor,
                child: ListTile(
                  title: Text(
                    itemTheme.toString(),
                    style: themeData[itemTheme].textTheme.body1,
                  ),
                  onTap: () => themeBloc.add(ThemeChanged(theme: itemTheme)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
