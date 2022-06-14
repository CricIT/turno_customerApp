import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

import '../../../app/config/constant.dart';
import '../../../app/routes/app_route.dart';

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
    store.isLoggedIn
        ? Get.offAllNamed(AppRoutes.LANDING_PAGE)
        : Get.toNamed(AppRoutes.LOGIN);
  }
}
