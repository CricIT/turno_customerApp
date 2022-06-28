import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'more_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MoreController());
  }
}
