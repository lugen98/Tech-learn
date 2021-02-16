import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManagement {
  static Future<SharedPreferences> get _instance async =>
      _sharedPreferences ??= await SharedPreferences.getInstance();
  static SharedPreferences _sharedPreferences;

  static Future<SharedPreferences> init() async {
    _sharedPreferences = await _instance;
    return _sharedPreferences;
  }

  static void setUserEmail(String email) async {
    var _sharedPreferences = await _instance;
    _sharedPreferences.setString('userEmail', email);
  }

  static getUserEmail() async {
    var _sharedPreferences = await _instance;
    String userEmail = _sharedPreferences.getString('userEmail');
    return userEmail;
  }

  static void setUserType(int userType) async {
    var _sharedPreferences = await _instance;
    _sharedPreferences.setInt('userType', userType);
  }

  static getUserType() async {
    var _sharedPreferences = await _instance;
    int intValue = _sharedPreferences.getInt('userType');
    return intValue;
  }

  static clearSharedPreferences() async {
    var _sharedPreferences = await _instance;
    _sharedPreferences.clear();
  }
}
