import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/services/app_update.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import '../../presentation/controllers/vehicle_controller/vehicle_details_controller.dart';
import '../config/app_text_styles.dart';
import '../config/dimentions.dart';
import '../constants/images.dart';

class Utils {
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String convertDate(int? timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp!);
    var format = DateFormat.yMMMMd();
    var dateString = format.format(date);
    return dateString;
  }

/*  static String mileageStatusText(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return 'danger'.tr;
    if (percent > 0.5 && percent < 0.8) return 'not_good'.tr;
    if (percent >= 0.8) return 'good'.tr;
    return '';
  }*/

  static String mileageStatusText(int percent) {
    if (percent == 2) return 'danger'.tr;
    if (percent == 1) return 'not_good'.tr;
    if (percent == 0) return 'good'.tr;
    return '';
  }

/*  static String mileageStatusIcon(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return Images.icon_danger;
    if (percent > 0.5 && percent < 0.8) return Images.icon_not_good;
    if (percent >= 0.8) return Images.icon_good;
    return '';
  }*/

  static String mileageStatusIcon(int previousChargeMileageStatus) {
    if (previousChargeMileageStatus == 0) return Images.icon_good;
    if (previousChargeMileageStatus == 1) return Images.icon_not_good;
    if (previousChargeMileageStatus == 2) return Images.icon_danger;
    return '';
  }

  static String chargingStatusText(int charge) {
    if (charge == 2) return 'danger'.tr;
    if (charge == 1) return 'not_good'.tr;
    if (charge == 0) return 'good'.tr;

    return '';
  }

  static String chargingStatusIcon(int charge) {
    if (charge == 2) return Images.icon_danger;
    if (charge == 1) return Images.icon_not_good;
    if (charge == 0) Images.icon_good;
    return '';
  }

  static void showAlertDialog({
    required String title,
    required String message,
    List<Widget>? actions,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      actions: actions,
    );
  }

  static void showBottomSheetWithMsg(String message) {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_DEFAULT,
              right: Dimensions.PADDING_SIZE_DEFAULT),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
              border: Border.all(
                color: AppColors.borderGray,
                width: 1,
              )),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'how_is_it_calculated'.tr,
                    style: lightBlackBold16,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Images.calculation),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      message,
                      style: lightBlackNormal14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )),
      isDismissible: true,
    );
  }

/* SHOW ALERT DIALOG FOR FORCE UPDATE */
  static showForceUpdateDialoug(
      BuildContext context, String msg, String okTitle,
      {required String title,
      Color backgroundColor = Colors.white,
      required Function() okHandler}) {
    return Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Visibility(
                  visible: (title != null) ? false : true,
                  child: Text(title, textAlign: TextAlign.center),
                ),
                content: Text(msg),
                actions: [
                  TextButton(onPressed: okHandler, child: Text(okTitle))
                ],
              );
            })
        : showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: _alertDialogHelp(context, msg, okTitle,
                    title: title,
                    backgroundColor: backgroundColor,
                    okHandler: okHandler),
              );
            },
          );
  }

  static Widget _alertDialogHelp(
      BuildContext context, String msg, String okTitle,
      {required String title,
      Color backgroundColor = Colors.white,
      required Function() okHandler}) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      title: CustomLabel(
        title: title,
        fontSize: Dimensions.FONT_SIZE_LARGE,
        textAlign: TextAlign.left,
        color: Colors.black,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: CustomLabel(
          title: msg,
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          textAlign: TextAlign.left,
          color: Colors.black,
        ),
      ),
      actions: [TextButton(onPressed: okHandler, child: Text(okTitle))],
    );
  }

  static showProgressDialog(BuildContext context, String title) {
    var controller = Get.find<AppUpdate>();
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                content: SizedBox(
                  height: 220,
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Obx(() => CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: controller.progress.value / 100,
                            center:
                                Text("${controller.progress.value.toInt()}%"),
                            progressColor: Colors.green,
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Obx(() {
                          return Visibility(
                              visible: controller.progress.value == 100,
                              child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.openDownloadedFile(
                                        Get.find<VehicleDetailsController>()
                                            .task
                                            .taskId);
                                  },
                                  child: Text(
                                    "Install".tr,
                                    style: TextStyle(
                                        fontSize: Dimensions.FONT_SIZE_LARGE),
                                  )));
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }

  static bool checkIfTheDecimalIsGreaterThanZero(String string) {
    RegExp reg1 = RegExp(r'(^[1-9](?:\.[1-9])?$)');
    if (reg1.stringMatch(string) != null) {
      return true;
    }
    return false;
  }
}
