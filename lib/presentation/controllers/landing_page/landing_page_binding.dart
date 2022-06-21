import 'package:get/get.dart';
import '../lang/lang_controller.dart';
import 'landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
/*    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SupportController());
    Get.lazyPut(() => MoreController());*/
    Get.find<LangController>().onInit();
  }
}
