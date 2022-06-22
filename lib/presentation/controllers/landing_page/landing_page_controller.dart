import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import '../../../app/services/local_storage.dart';

class LandingPageController extends GetxController {
  var selectedIndex = 0.obs;
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    store.pushDataToBackEnd();
    TrackHandler.trackScreen(screenName: '/LandingPage');
  }

  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
