import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';
import 'package:turno_customer_application/app/util/util.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

class PermissionsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final store = Get.find<LocalStorageService>();
  void getPermission() async {
    Location location = Location();
    bool serviceEnabled;
    // PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        AppSettings.openLocationSettings();
      }
    }

    var locationPermission = await Permission.location.request();
    if (locationPermission.isDenied) {
      locationPermission = await Permission.location.request();
      if (!locationPermission.isGranted) {
        Utils.showAlertDialog(
          title: 'Alert!',
          message:
              'We require permissions to prevent fraudulent activities. Go to  Permissions ->  Location -> Allow',
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                AppSettings.openAppSettings();
              },
              child: const CustomLabel(
                title: 'Open App Settings',
              ),
            ),
          ],
        );
      }
    }

    //storage permission
    var storagePermission = await Permission.storage.request();
    if (storagePermission.isDenied) {
      storagePermission = await Permission.storage.request();
      if (!storagePermission.isGranted) {
        Utils.showAlertDialog(
          title: 'Alert!',
          message:
              'We require permissions to prevent fraudulent activities. Go to  Permissions ->  Storage -> Allow',
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                AppSettings.openAppSettings();
              },
              child: const CustomLabel(
                title: 'Open App Settings',
              ),
            ),
          ],
        );
      }
    }

    //sms permissions
    final telephony = Telephony.instance;
    try {
      final bool? result = await telephony.requestPhoneAndSmsPermissions;
      if (result == true &&
          storagePermission.isGranted &&
          locationPermission.isGranted) {
        store.isLoggedIn
            ? Get.offNamed(AppRoutes.LANDING_PAGE)
            : Get.offNamed(AppRoutes.LANGUAGE);
      }
    } catch (e) {
      Utils.showAlertDialog(
        title: 'Alert!',
        message:
            'We require permissions to prevent fraudulent activities. Go to  Permissions ->  SMS -> Allow',
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              AppSettings.openAppSettings();
            },
            child: const CustomLabel(
              title: 'Open App Settings',
            ),
          ),
        ],
      );
    }
  }
}
