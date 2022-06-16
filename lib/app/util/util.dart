import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
