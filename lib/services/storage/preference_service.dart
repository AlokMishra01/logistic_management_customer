import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Getter and Setters to store, manipulate, delete and get stored data
}
