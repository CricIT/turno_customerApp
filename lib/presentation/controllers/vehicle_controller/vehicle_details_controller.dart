import 'dart:io';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/constants/network_used_case.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

import '../../../app/services/app_update.dart';
import '../../../app/util/util.dart';
import '../../../data/network/api_provider.dart';
import '../../../domain/entities/vehicle.dart';
import '../../../domain/usecases/vehicle/vehicle_usecase.dart';
import '../landing_page/landing_page_controller.dart';

class VehicleDetailsController extends GetxController {
  VehicleDetailsController(this._vehicleUseCase);

  // vehicle details factory instance
  final VehicleUseCase _vehicleUseCase;

  //page refresh instance
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  //api response
  var _myVehicleDetails = Rx<Vehicle?>(null);
  //local storage insatnce
  final store = Get.find<LocalStorageService>();

  //Rest api call used case initial value
  var usedCaseScenarios = NetworkUsedCase.loading.obs;

  //variable to control user details visibility on toolbar
  var isDataAvailable = false.obs;

  //download latest version of apk instance
  final appUpdate = Get.find<AppUpdate>();

  //latest apk details model
  late TaskInfo task;

  //device information
  late PackageInfo packageInfo;


  //to avoid multiple pop up if the download pop up is already shown
  var isDownloading=false;


  // returns vehicle details
  Rx<Vehicle?> get getVehicelDetails {
    return _myVehicleDetails;
  }

  // set vehicle details
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
      //set used case to loading
      usedCaseScenarios.value = NetworkUsedCase.loading;
      final response = await _vehicleUseCase.execute(store.mobileNumber);
      response.fold((error) => _handleVehicleDetailsErorCase(error: error),
          (success) => _handleVehicleDetailsSuccessCase(success.obs));
    } catch (exception) {
      _handleVehicleDetailsErorCase(exception: exception);
    }
  }

  _handleVehicleDetailsErorCase({String? error, Object? exception}) {
    //set used case to user not
    if (exception is BadRequestException && exception.details == "Not found") {
      return usedCaseScenarios.value = NetworkUsedCase.usernotfound;
    }
//other errors
    usedCaseScenarios.value = NetworkUsedCase.error;
    isDataAvailable.value = false;
    refreshController.refreshCompleted();
  }

  _handleVehicleDetailsSuccessCase(Rx<Vehicle> success) async {
    usedCaseScenarios.value = NetworkUsedCase.sucess;
    setVehicleDeatils = success;
    isDataAvailable.value = true;
    refreshController.refreshCompleted();
    packageInfo = await PackageInfo.fromPlatform();
    // appUpdate.deleteFile("${success.value.payload!.appVersionResponse!.appLink!.split('/').last}");
    if (Platform.isAndroid) {
      _chechIfForceUpdateAvialable(success);
    }
  }




//on click of get help navigate to get help screen
  navigateToSupport() {
    final landingPageController = Get.find<LandingPageController>();
    landingPageController.setSelectedIndex(2);
  }


  //check if there is an force update flag true
  // then check if the apk version in remote is higher than the existing app
  // if yes
  // then download apk from server and prompt user to install the latest apk
  void _chechIfForceUpdateAvialable(Rx<Vehicle> success) {
    if (isDownloading == false) {
      if (success.value.payload!.appVersionResponse!.forceUpdate!) {
        if (
        double.parse(packageInfo.version.substring(0,3)) <
            success.value.payload!.appVersionResponse!.appVersion!) {
          Utils.showForceUpdateDialoug(
              Get.context!, "new_version_msg".tr, "update".tr,
              title: "new_version_title".tr, okHandler: () {
            appUpdate.deleteFile(
                "${success.value.payload!.appVersionResponse!.appLink!.split('/').last}");
            isDownloading = true;
            task = TaskInfo(
                name: "Apk",
                link: success.value.payload!.appVersionResponse!.appLink);
            appUpdate.requestDownload(task).then((value) => {
              task.taskId = value,
            });
            Utils.showProgressDialog(Get.context!, "progress".tr);
          });
        }
      }
    }
  }
}
