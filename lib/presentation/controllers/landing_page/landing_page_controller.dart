import 'package:get/get.dart';
import 'package:turno_customer_application/domain/entities/vehicle.dart';
import 'package:turno_customer_application/domain/usecases/vehicle/vehicle_usecase.dart';
import '../../../app/services/local_storage.dart';

class LandingPageController extends GetxController {
  LandingPageController(this._vehicleUseCase);

  final VehicleUseCase _vehicleUseCase;

  final store = Get.find<LocalStorageService>();
  var selectedIndex = 0.obs;
  Future<Vehicle>? myVehicleDetails;

  //get the user preferred language and set
  @override
  void onInit() async {
    super.onInit();
    myVehicleDetails = fetchVehicleData();
    store.pushDataToBackEnd();
  }

  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future<Vehicle> fetchVehicleData() async {
    String mobile = '7093880128';
    final response = await _vehicleUseCase.execute(mobile);
    return response;
  }
}
