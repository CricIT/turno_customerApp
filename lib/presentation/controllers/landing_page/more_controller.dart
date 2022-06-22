import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import '../../../app/routes/app_route.dart';
import '../../../app/services/local_storage.dart';

class MoreController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/MoreScreen');
  }

  final store = Get.find<LocalStorageService>();

  logout() {
    store.user = null;
    store.isLoggedIn = false;
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
