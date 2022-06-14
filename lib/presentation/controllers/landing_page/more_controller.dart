import 'package:get/get.dart';
import '../../../app/routes/app_route.dart';
import '../../../app/services/local_storage.dart';

class MoreController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final store = Get.find<LocalStorageService>();

  logout() {
    store.user = null;
    store.isLoggedIn = false;
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
