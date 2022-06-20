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

  @override
  onInit() {
    super.onInit();
    myVehicleDetails = fetchVehicleData();
  }

  void onReady() {
    //store.pushDataToBackEnd();
    super.onReady();
  }

  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future<Vehicle> fetchVehicleData() async {
    String mobile = store.mobileNumber;
    final response = await _vehicleUseCase.execute(mobile);
    return response;
  }
}
