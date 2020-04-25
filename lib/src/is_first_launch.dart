import 'package:shared_preferences/shared_preferences.dart';

bool isFirstLaunch = true;

Future<SharedPreferences> saveIsFirstLaunch(bool isFirstLaunch) async {
  var prefs = await SharedPreferences.getInstance();
  String key = 'isFirstLaunch';
  bool value = isFirstLaunch;
  prefs.setBool(key, value);
}

Future<bool> readIsFirstLaunch() async {
  var prefs = await SharedPreferences.getInstance();
  String key = 'isFirstLaunch';
  isFirstLaunch = prefs.getBool(key);
  return isFirstLaunch;
}
