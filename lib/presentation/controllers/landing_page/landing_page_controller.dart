


import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import '../../../app/services/local_storage.dart';



class LandingPageController extends GetxController {

  final store = Get.find<LocalStorageService>();
  var selectedIndex = 0.obs;


 //get the user preferred language and set
  @override
  void onInit() async {
    super.onInit();
    Get.updateLocale(Constants.locale.where((element) => element['name'] == store.getLanguage).first['locale']);
  }

  //save user preferred language into sharedPreferences
  void setUserPreferredLanguage(locale) {
    store.setLanguage=locale;
  }

  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index){
    selectedIndex.value = index;
  }




}