import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turno_customer_application/domain/entities/user.dart';

enum _Key {
  lang,
  fcmToken,
  user,
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  ///Get User.
  User? get user {
    final rawJson = _sharedPreferences?.getString(
      _Key.user.toString(),
    );
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }

  ///Set user.
  set user(User? value) {
    if (value != null) {
      _sharedPreferences?.setString(
        _Key.user.toString(),
        json.encode(
          value.toJson(),
        ),
      );
    } else {
      _sharedPreferences?.remove(
        _Key.user.toString(),
      );
    }
  }

  ///Get user previous preferred language.
  String? get getLanguage {
    final language = _sharedPreferences?.getString(
      _Key.lang.toString(),
    );
    if (language == null) {
      return "en_US";
    }
    return language;
  }

  ///Set user preferred language.
  set setLanguage(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.lang.toString(), value);
    } else {
      _sharedPreferences?.setString(_Key.lang.toString(), "en_US");
    }
  }

  ///get Firebase token.
  String? get getFCMToken {
    final token = _sharedPreferences?.getString(
      _Key.fcmToken.toString(),
    );
    return token;
  }

  ///Set Firebase token.
  set setToken(String? value) {
    if (value != null) {
      _sharedPreferences?.setString(_Key.fcmToken.toString(), value);
    }
  }
}
