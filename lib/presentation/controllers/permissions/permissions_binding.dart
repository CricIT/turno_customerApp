import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/permissions/permission_controller.dart';

class PermissionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PermissionsController());
  }
}
