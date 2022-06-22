import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
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

  static String mileageStatusText(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return 'danger'.tr;
    if (percent > 0.5 && percent < 0.8) return 'not_good'.tr;
    if (percent >= 0.8) return 'good'.tr;
    return '';
  }

  static String mileageStatusIcon(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return Images.icon_danger;
    if (percent > 0.5 && percent < 0.8) return Images.icon_not_good;
    if (percent >= 0.8) return Images.icon_good;
    return '';
  }

  static String chargingStatusText(int charge) {
    if (charge <= 10) return 'danger'.tr;
    if (charge > 10 && charge <= 20) return 'not_good'.tr;
    if (charge > 10 && charge <= 80) return 'good'.tr;
    if (charge > 80 && charge <= 90) return 'not_good'.tr;
    if (charge > 90) return 'danger'.tr;
    return '';
  }

  static String chargingStatusIcon(int charge) {
    if (charge <= 10) return Images.icon_danger;
    if (charge > 10 && charge <= 20) return Images.icon_not_good;
    if (charge > 10 && charge <= 80) Images.icon_good;
    if (charge > 80 && charge <= 90) return Images.icon_not_good;
    if (charge > 90) return Images.icon_danger;
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
}
