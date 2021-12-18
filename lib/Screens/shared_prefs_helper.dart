// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  void setStringInPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs
        .setString('string', "this is string")
        .then((value) => print(value));
    // await _prefs.setString('first_name', fName).then((value) => print(value));
    // _prefs.setString('last_name', lName).then((value) => print(value));
    // print("done");
  }
}
