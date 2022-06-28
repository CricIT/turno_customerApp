import 'package:get/instance_manager.dart';
import 'package:turno_customer_application/presentation/controllers/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
