// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  static const KEY_OPEN_ONBOARDING = "onBoarding";

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get openOnBoarding =>
      _sharedPrefs?.getBool(KEY_OPEN_ONBOARDING) ?? false ;
      

  set openOnBoarding(bool value) {
    _sharedPrefs?.setBool(KEY_OPEN_ONBOARDING, value);
  }

}

final sharedPrefs = SharedPrefs();
