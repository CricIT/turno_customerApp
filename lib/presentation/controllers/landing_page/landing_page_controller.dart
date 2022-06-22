import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/app_update.dart';
import '../../../app/services/local_storage.dart';

class LandingPageController extends GetxController {
  var selectedIndex = 0.obs;
  final store = Get.find<LocalStorageService>();
  final appUpdate= Get.find<AppUpdate>();

  @override
  void onInit() {
    _PrepareForDownload();
    super.onInit();
    store.pushDataToBackEnd();


  }




  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void _PrepareForDownload() async {
    bool permissionReady;
    permissionReady = await appUpdate.checkPermission();
    if (permissionReady) {
      await appUpdate.prepareSaveDir();
    }
  }
}
