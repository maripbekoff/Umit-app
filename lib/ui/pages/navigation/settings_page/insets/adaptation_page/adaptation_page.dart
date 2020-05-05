import 'package:flutter/material.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:umit/ui/pages/navigation/settings_page/insets/adaptation_page/tiles.dart';

class AdaptationPage extends StatelessWidget {
  const AdaptationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Center(
              child: Text("Адаптация", style: titleTextStyle),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        buildSmartAdaptationTile(context),
                        buildColorSettingsExpansionTile(context),
                        buildVoiceoverSwitchListTile(context),
                        buildSubtitlesSwitchListTile(context),
                        buildFontSizeSlider(context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.arrow_back, color: Colors.black),
                        title: Text(
                          "Назад",
                          style: defaultRegularTextStyle,
                        ),
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
}
