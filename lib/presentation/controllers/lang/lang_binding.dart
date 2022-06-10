import 'package:get/instance_manager.dart';

import 'lang_controller.dart';

class LangBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LangController());
  }
}
