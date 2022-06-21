import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:turno_customer_application/domain/entities/user.dart';

import '../../data/repositories/background_repository.dart';
import '../../domain/usecases/background/background_usedcase.dart';

enum _Key {
  lang,
  fcmToken,
  user,
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  final BackGroundUseCase _backgroundUseCase =
      BackGroundUseCase(Get.find<BackGroundRepositoryIml>());

  List<SmsMessage> smsmessages = [];
  final telephony = Telephony.instance;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  //fetch all sms from the inbox filter based on credit and debit and push to backend
  Future<void> pushDataToBackEnd() async {
    try {
      final bool? result = await telephony.requestPhoneAndSmsPermissions;
      if (result != null && result) {
        smsmessages.addAll(await telephony.getInboxSms(
            columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
            filter: SmsFilter.where(SmsColumn.DATE)
                .greaterThan(getLastPushedDateTime)
                .and(SmsColumn.BODY)
                .like('%credited%')));
        smsmessages.addAll(await telephony.getInboxSms(
            columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
            filter: SmsFilter.where(SmsColumn.DATE)
                .greaterThan(getLastPushedDateTime)
                .and(SmsColumn.BODY)
                .like('%debited%')));

        _backgroundUseCase.execute(Tuple3(mobileNumber,
            DateTime.now().millisecondsSinceEpoch.toString(), smsmessages));
      }
    } catch (e) {
      print(e);
    }
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

  /// isLoggedIn
  set isLoggedIn(bool value) {
    _sharedPreferences?.setBool('isLoggedIn', value);
  }

  bool get isLoggedIn => _sharedPreferences?.getBool('isLoggedIn') ?? false;

  /// Set user phone number
  set mobileNumber(String value) {
    _sharedPreferences?.setString('mobile', value);
  }

  /// Get user phone number
  String get mobileNumber => _sharedPreferences?.getString('mobile') ?? '';

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






  String get getLastPushedDateTime => _sharedPreferences?.getString('lastPush') ?? "";

  /// Set user phone number
  set setLastPushDateTime(String value) {
    _sharedPreferences?.setString('lastPush', value);
  }

}
