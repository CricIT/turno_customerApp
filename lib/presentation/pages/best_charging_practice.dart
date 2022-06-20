import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_text_styles.dart';

import '../../app/config/dimentions.dart';
import '../../app/constants/images.dart';
import '../../app/util/util.dart';
import '../widgets/custom_label.dart';
import '../widgets/generic_appbar.dart';
import '../widgets/prefix_icon_text.dart';

class BestChargingPractice extends GetView<VehicleDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: GenericAppBar(heading: "best_practices".tr)),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              color: AppColors.whiteColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    _previousChargePerformance(
                      wasPreviousChargeMileageLow: controller.getVehicelDetails
                          .value?.payload!.wasPreviousChargeMileageLow,
                      previousChargeMileage: controller.getVehicelDetails.value
                          ?.payload!.previousChargeMileage,
                      idealMileage: controller
                          .getVehicelDetails.value?.payload!.idealMileage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.darkGray,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'charging_guidelines'.tr,
                            style: lightBlackBold16,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "guide_txt".tr,
                            style: darkGrayNormal12,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrefixIconTextView(
                            icon: Images.icon_good,
                            text: "best".tr,
                            fontSize: Dimensions.FONT_SIZE_XXLARGE,
                            textcolor: AppColors.darkgreen,
                            fontWeight: FontWeight.w600,
                            iconHeight: 18,
                            iconWidth: 18,
                          ),
                          _bestPracticeGuideContainer(),
                          const SizedBox(
                            height: 10,
                          ),
                          PrefixIconTextView(
                            icon: Images.icon_not_good,
                            text: "warning".tr,
                            fontSize: Dimensions.FONT_SIZE_XXLARGE,
                            textcolor: AppColors.darkyello,
                            fontWeight: FontWeight.w600,
                            iconHeight: 18,
                            iconWidth: 18,
                          ),
                          _warningGuideContainer(),
                          const SizedBox(
                            height: 10,
                          ),
                          PrefixIconTextView(
                            icon: Images.icon_danger,
                            text: "danger".tr,
                            fontSize: Dimensions.FONT_SIZE_XXLARGE,
                            textcolor: AppColors.darkred,
                            fontWeight: FontWeight.w600,
                            iconHeight: 18,
                            iconWidth: 18,
                          ),
                          _dangerContainer(),
                        ],
                      ),
                    ),
                  ])),
        )));
  }

  _previousChargePerformance(
      {required wasPreviousChargeMileageLow,
      required previousChargeMileage,
      required idealMileage}) {
    return Container(
      padding: const EdgeInsets.only(
          top: Dimensions.PADDING_SIZE_LARGE,
          bottom: Dimensions.PADDING_SIZE_LARGE,
          right: Dimensions.PADDING_SIZE_LARGE),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabel(
                        title: "last_charger_plugged_at".tr,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomLabel(
                          title: "$previousChargeMileage",
                          fontSize: Dimensions.FONT_SIZE_XXLARGE,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                      const SizedBox(
                        height: 8,
                      ),
                      PrefixIconTextView(
                        icon: Utils.mileageStatusIcon(
                            previousChargeMileage, idealMileage),
                        text: Utils.mileageStatusText(
                            previousChargeMileage, idealMileage),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLabel(
                          title: "charged_till".tr,
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomLabel(
                          title: "97%",
                          fontSize: Dimensions.FONT_SIZE_XXLARGE,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                      const SizedBox(
                        height: 8,
                      ),
                      PrefixIconTextView(
                        icon: Images.icon_good,
                        text: "good".tr,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _bestPracticeGuideContainer() {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      decoration: BoxDecoration(
          color: AppColors.greenBg,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Images.green_auto),
              SvgPicture.asset(Images.green_battery),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          PrefixIconTextView(
            icon: Images.icon_battery,
            iconWidth: 18,
            iconHeight: 18,
            text: "msg_20_80".tr,
          ),
          const SizedBox(
            height: 10,
          ),
          PrefixIconTextView(
            icon: Images.icon_plug_in,
            iconWidth: 18,
            iconHeight: 18,
            text: "msg_plug_in".tr,
          ),
          const SizedBox(
            height: 10,
          ),
          PrefixIconTextView(
            icon: Images.icon_plug_out,
            iconWidth: 18,
            iconHeight: 18,
            text: "msg_unplug".tr,
          ),
        ],
      ),
    );
  }

  _warningGuideContainer() {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      decoration: BoxDecoration(
          color: AppColors.yellowbg,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Images.orange_auto),
              SvgPicture.asset(Images.yellow_battery),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(Images.icon_battery),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "msg_warning".tr,
                  style: darkGrayNormal12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _dangerContainer() {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      decoration: BoxDecoration(
          color: AppColors.redbg,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Images.red_auto),
              SvgPicture.asset(Images.red_battery),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(Images.icon_battery),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "msg_danger".tr,
                  style: darkGrayNormal12,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(Images.icon_plug_out),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "msg_danger_chaging_above100".tr,
                  style: darkGrayNormal12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
