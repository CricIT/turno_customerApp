import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/constants/network_used_case.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

import '../../../data/network/api_provider.dart';
import '../../../domain/entities/vehicle.dart';
import '../../../domain/usecases/vehicle/vehicle_usecase.dart';

class VehicleDetailsController extends GetxController {
  VehicleDetailsController(this._vehicleUseCase);

  final VehicleUseCase _vehicleUseCase;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  var _myVehicleDetails = Rx<Vehicle?>(null);
  final store = Get.find<LocalStorageService>();
  var usedCaseScenarios = NetworkUsedCase.loading.obs;
  var isDataAvailable = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  Rx<Vehicle?> get getVehicelDetails {
    return _myVehicleDetails;
  }

  set setVehicleDeatils(
    Rx<Vehicle> vehicleDetails,
  ) {
    _myVehicleDetails = vehicleDetails;
  }

  /*
 1 show loading
 2 hide loding show error
 3 user not found
 4 hide loding show result
 */
  fetchVehicleData() async {
    try {
      usedCaseScenarios.value = NetworkUsedCase.loading;
      final response = await _vehicleUseCase.execute(store.mobileNumber);
      response.fold((error) => _handleVehicleDetailsErorCase(error: error),
          (success) => _handleVehicleDetailsSuccessCase(success.obs));
    } catch (exception) {
      _handleVehicleDetailsErorCase(exception: exception);
    }
  }

  _handleVehicleDetailsErorCase({String? error, Object? exception}) {
    if (exception is BadRequestException && exception.details == "Not found") {
      return usedCaseScenarios.value = NetworkUsedCase.usernotfound;
      // useNotFound.value = true;
    }
    usedCaseScenarios.value = NetworkUsedCase.error;
    isDataAvailable.value = false;
    refreshController.refreshCompleted();
  }

  _handleVehicleDetailsSuccessCase(Rx<Vehicle> success) {
    usedCaseScenarios.value = NetworkUsedCase.sucess;
    setVehicleDeatils = success;
    isDataAvailable.value = true;
    refreshController.refreshCompleted();
  }
}
