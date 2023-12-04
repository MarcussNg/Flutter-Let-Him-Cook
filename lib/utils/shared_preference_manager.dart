import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static SharedPreferences? _sharedPreferences;

  // Stored data
  static const spAccessToken = 'accessToken';
  static const spRefreshToken = 'refreshToken';

  static Future<SharedPreferences> getSharedPreference() async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static void putAccessToken(String? token) {
    _sharedPreferences?.setString(spAccessToken, token ?? '');
  }

  static String getAccessToken() {
    return _sharedPreferences?.getString(spAccessToken) ?? '';
  }

  static void putRefreshToken(String? token) {
    _sharedPreferences?.setString(spRefreshToken, token ?? '');
  }

  static String getRefreshToken() {
    return _sharedPreferences?.getString(spRefreshToken) ?? '';
  }
}
