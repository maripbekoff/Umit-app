import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/src/blocs/selectedThemeBloc/selected_theme_bloc.dart';
import 'package:umit/src/blocs/switchBloc/switch_bloc.dart';
import 'package:umit/src/blocs/themeBloc/bloc.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/src/global/themes.dart';
import 'package:umit/ui/pages/navigation/settings_page/insets/adaptation_page/insets/smart_adaptation.dart';

Widget buildSmartAdaptationTile(BuildContext context) {
  return ListTile(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return buildSmartAdaptationDialog(context);
        },
      );
    },
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
  );
}

Widget buildColorSettingsExpansionTile(BuildContext context) {
  ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
  SwitchBloc switchBloc = BlocProvider.of<SwitchBloc>(context);
  SelectedThemeBloc selectedThemeBloc =
      BlocProvider.of<SelectedThemeBloc>(context);

  _buildSelectedThemeIndicator() {
    return Positioned(
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
  }

  _buildFlatButton(state, int index, AppTheme itemTheme) {}

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
            itemCount: AppTheme.values.length,
            itemBuilder: (BuildContext context, int index) {
              final itemTheme = AppTheme.values[index];

              return BlocBuilder<SelectedThemeBloc, SelectedThemeState>(
                builder: (BuildContext context, SelectedThemeState state) {
                  return FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      selectedThemeBloc
                          .add(SelectedTheme(selectedThemeIndex: index));
                      themeBloc.add(ThemeChanged(theme: itemTheme));
                    },
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
                                color: themeData[itemTheme].primaryColor,
                              ),
                            ),
                            state.props[0] == index
                                ? _buildSelectedThemeIndicator()
                                : Offstage(),
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
              );
            },
          ),
        ),
      ),
      BlocBuilder<SwitchBloc, SwitchState>(
        builder: (BuildContext context, SwitchState state) {
          if (state is SwitchChangedTheme) {
            return SwitchListTile.adaptive(
              value: state.isSwitched,
              onChanged: (bool value) {
                debugPrint('Activated [SwitchChangedTheme] Switch  /  $value');
                switchBloc.add(SwitchChanged(isSwitched: value));
                if (value) {
                  themeBloc.add(ThemeChanged(theme: AppTheme.Dark));
                } else {
                  themeBloc.add(ThemeChanged(theme: AppTheme.Default));
                }
              },
              title: Text(
                "Контрастность",
                style: defaultRegularTextStyle,
              ),
            );
          } else if (state is SwitchInitial) {
            return SwitchListTile.adaptive(
              value: state.props[0],
              onChanged: (bool value) {
                debugPrint('Activated Initial Switch   /   $value');
                switchBloc.add(SwitchChanged(isSwitched: value));

                if (value) {
                  themeBloc.add(ThemeChanged(theme: AppTheme.Dark));
                } else {
                  themeBloc.add(ThemeChanged(theme: AppTheme.Default));
                }
              },
              title: Text(
                "Контрастность",
                style: defaultRegularTextStyle,
              ),
            );
          }
        },
      ),
    ],
  );
}

Widget buildVoiceoverSwitchListTile(BuildContext context) {
  bool _isSwitched = true;

  return SwitchListTile.adaptive(
    value: _isSwitched,
    onChanged: (bool value) {
      _isSwitched = value;
      print(value);
    },
    title: Text(
      "Talkback/Voiceover",
      style: defaultRegularTextStyle,
    ),
  );
}

Widget buildSubtitlesSwitchListTile(BuildContext context) {
  bool _currentValue = false;

  return SwitchListTile.adaptive(
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
