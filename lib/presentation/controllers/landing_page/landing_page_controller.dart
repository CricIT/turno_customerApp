import 'package:get/get.dart';
import '../../../app/services/local_storage.dart';

class LandingPageController extends GetxController {
  var selectedIndex = 0.obs;
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    store.pushDataToBackEnd();
  }


  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
