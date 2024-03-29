import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

import '../../../app/config/constant.dart';
import '../../../app/routes/app_route.dart';

class LangController extends GetxController {
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/LanguageScreen');
    Get.updateLocale(Constants.locale
        .where((element) => element['name'] == store.getLanguage)
        .first['locale']);
  }

  void setUserPreferredLanguage(locale) {
    store.setLanguage = locale;
    TrackHandler.setUserLanguage(lang: locale);
    store.isLoggedIn ? Get.back() : Get.toNamed(AppRoutes.LOGIN);
  }
}
