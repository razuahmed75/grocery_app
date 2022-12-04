import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePref {
  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();
}
