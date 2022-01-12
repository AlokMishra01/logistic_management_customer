import 'package:shared_preferences/shared_preferences.dart';

import '../constants/preferences.dart' as preferences;
import '../models/login_response_model.dart';

class PreferenceService {
  static PreferenceService service = PreferenceService();

  SharedPreferences? _sharedPreferences;

  _initSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  setUser(LoginResponseModel model) async {
    await _initSharedPreferences();
    _sharedPreferences?.setString(
      preferences.TOKEN,
      model.token ?? '',
    );

    _sharedPreferences?.setBool(
      preferences.IS_LOGIN,
      true,
    );
  }

  clearPreferences() async {
    await _initSharedPreferences();
    _sharedPreferences?.clear();
  }

  Future<bool> get isLogin async {
    await _initSharedPreferences();
    return _sharedPreferences?.getBool(preferences.IS_LOGIN) ?? false;
  }

  Future<String> get token async {
    await _initSharedPreferences();
    return _sharedPreferences?.getString(preferences.TOKEN) ?? '';
  }
}
