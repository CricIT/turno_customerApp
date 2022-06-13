


import 'package:get/get.dart';
import '../../../app/services/local_storage.dart';


class LandingPageController extends GetxController {

  final store = Get.find<LocalStorageService>();
  var selectedIndex = 0.obs;


 //get the user preferred language and set
  @override
  void onInit() async {
    super.onInit();
  }


  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index){
    selectedIndex.value = index;
  }




}