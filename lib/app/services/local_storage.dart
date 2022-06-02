import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  lang,
  fcmToken,
}


class LocalStorageService extends GetxService {

  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

// get user previous preferred language
  String? get getLanguage {
    final language = _sharedPreferences?.getString(_Key.lang.toString());
    if (language == null) {
      return "en_US";
    }
    return language;
  }

  //set user preferred language
  set setLanguage(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(
          _Key.lang.toString(),value);
    }else{
      _sharedPreferences?.setString(
          _Key.lang.toString(),"en_US");
    }
    
  }

  String? get getFCMToken {
    final token = _sharedPreferences?.getString(_Key.fcmToken.toString());
    return token;
  }

  set setToken(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.fcmToken.toString(), value);
    }
  }

}
