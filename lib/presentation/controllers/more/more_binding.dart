import 'package:get/instance_manager.dart';
import 'package:turno_customer_application/presentation/controllers/more/more_controller.dart';

class MoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MoreController());
  }
}
