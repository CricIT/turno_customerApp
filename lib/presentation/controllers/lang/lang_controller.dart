import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

import '../../../app/config/constant.dart';

class LangController extends GetxController {
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    Get.updateLocale(Constants.locale
        .where((element) => element['name'] == store.getLanguage)
        .first['locale']);
  }

  void setUserPreferredLanguage(locale) {
    store.setLanguage = locale;
  }
}
