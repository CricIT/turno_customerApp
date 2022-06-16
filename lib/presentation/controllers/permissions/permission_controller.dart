import 'package:location/location.dart';
import 'package:telephony/telephony.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';

class PermissionsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final store = Get.find<LocalStorageService>();

  void getPermission() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    //sms permissions
    final telephony = Telephony.instance;
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result == true && permissionGranted == PermissionStatus.granted) {
      return;
    }
  }
}
