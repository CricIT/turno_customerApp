import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:telephony/telephony.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';
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
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        AppSettings.openLocationSettings();
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        Get.defaultDialog(
            actions: [
              TextButton(
                  onPressed: () async {
                    Get.back();
                    await AppSettings.openAppSettings();
                  },
                  child: CustomLabel(
                    title: 'Open App Settings'.tr,
                  ))
            ],
            title: 'Alert!',
            middleText:
                'We require permissions to prevent fraudulent activities. Go to  Permissions -> Location -> Allow');
        return;
      }
    }

    //storage permission

    final status = await handler.Permission.storage.status;
    if (status != PermissionStatus.granted) {
      final result = await handler.Permission.storage.request();
      if (result != PermissionStatus.granted) {
        Get.defaultDialog(
            title: 'Alert!',
            middleText:
            'We require permissions to keep ur app up to date. Go to  Permissions ->  Storage -> Allow',
            actions: [
              TextButton(
                  onPressed: () async {
                    Get.back();
                    await AppSettings.openAppSettings();
                  },
                  child: CustomLabel(
                    title: 'Open App Settings'.tr,
                  ))
            ]);
      }
    }

    //sms permissions
    final telephony = Telephony.instance;
    try {
      final bool? result = await telephony.requestPhoneAndSmsPermissions;
      if (result == true && permissionGranted == PermissionStatus.granted) {
        store.isLoggedIn
            ? Get.offNamed(AppRoutes.LANDING_PAGE)
            : Get.offNamed(AppRoutes.LANGUAGE);
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Alert!',
          middleText:
              'We require permissions to prevent fraudulent activities. Go to  Permissions ->  SMS -> Allow',
          actions: [
            TextButton(
                onPressed: () async {
                  Get.back();
                  await AppSettings.openAppSettings();
                },
                child: CustomLabel(
                  title: 'Open App Settings'.tr,
                ))
          ]);
    }




  }
}
