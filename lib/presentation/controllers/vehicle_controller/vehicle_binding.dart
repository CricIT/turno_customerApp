



import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';


import '../../../data/repositories/vehicle_repository.dart';
import '../../../domain/usecases/vehicle/vehicle_usecase.dart';

class VehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleUseCase(Get.find<VehicleRepositoryIml>()));
    Get.lazyPut(() => VehicleDetailsController(Get.find()));
  }
}
