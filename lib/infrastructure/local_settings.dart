import 'package:shared_preferences/shared_preferences.dart';

class LocalSettings {

  static SharedPreferences? _prefs;
  static const String _keyUserName = 'UserName';
  static const String _keyPassword = 'Password';


  String? _userName;
  String? _password;

  static final LocalSettings _singleton = LocalSettings._internal();

  factory LocalSettings() {
    return _singleton;
  }

  LocalSettings._internal();

  static Future<LocalSettings> getSettings() async {
    _prefs = await SharedPreferences.getInstance();

    var ss = LocalSettings();

    ss._userName = _prefs?.getString(_keyUserName);
    ss._password = _prefs?.getString(_keyPassword);

    return ss;
  }

  Future clearSettings() async {
    await _prefs?.remove(_keyUserName);
    await _prefs?.remove(_keyPassword);
  }

  //UserName
  String? get userName => _userName;
  set userName(String? newPhone) { _prefs?.setString(_keyUserName, newPhone ?? ''); }

  //Password
  String? get password => _password;
  set password(String? pwd) { _prefs?.setString(_keyPassword, pwd ?? ''); }
}