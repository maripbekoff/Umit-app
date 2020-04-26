import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> saveIsFirstLaunch(bool isFirstLaunch) async {
  var prefs = await SharedPreferences.getInstance();
  String key = 'isFirstLaunch';
  bool value = isFirstLaunch;
  prefs.setBool(key, value);
}

Future<bool> readIsFirstLaunch() async {
  var prefs = await SharedPreferences.getInstance();
  String key = 'isFirstLaunch';
  bool value = prefs.getBool(key);
  return value;
}
