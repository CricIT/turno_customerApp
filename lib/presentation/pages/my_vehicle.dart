import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/app/constants/network_used_case.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_text_button.dart';
import '../../app/config/app_colors.dart';
import '../../app/constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/util/util.dart';
import '../widgets/custom_label.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/error_widget.dart';
import '../widgets/guage_card.dart';
import '../widgets/home_appbar.dart';
import '../widgets/prefix_icon_text.dart';
import 'coming_soon.dart';

class MyVehicle extends GetView<VehicleDetailsController> {
  const MyVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constants.deviceHeight * 0.08),
          child: Obx(() {
            return Visibility(
                visible: controller.isDataAvailable.value? true : false,
                child: BaseAppBar(
                  customerName:controller.getVehicelDetails.value==null?"": controller.getVehicelDetails.value?.payload!.userName,
                  vehicleName: controller.getVehicelDetails.value==null?"":controller.getVehicelDetails.value?.payload!.vehicleName,
                ));
          })),
      body: GetX(
          init: controller,
          builder: (builder) {
            return SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.fetchVehicleData,
              header: const WaterDropHeader(),
              child: SingleChildScrollView(
                child: renderUI(),
              ),
            );
          }),
    );
  }

  _vehicleSocAndCurrentBuyBackValue(
      {int? currentSoc, int? currentRangeLeft, int? buybackValueAfter3Year}) {
    return Container(
        padding: const EdgeInsets.only(
            top: Dimensions.PADDING_SIZE_LARGE,
            bottom: Dimensions.PADDING_SIZE_LARGE,
            left: Dimensions.PADDING_SIZE_XXLARGE,
            right: Dimensions.PADDING_SIZE_XXLARGE),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
            border: Border.all(
              color: AppColors.borderGray,
              width: 1,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Images.batteryChagre),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomLabel(
                            title: "charge".tr,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGray,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomLabel(
                          title: "$currentSoc %",
                          fontSize: Dimensions.FONT_SIZE_XXLARGE,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black)
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Images.bolt),
                          const SizedBox(
                            width: 8,
                          ),
                          CustomLabel(
                              title: "available_range".tr,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGray)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomLabel(
                          title: "$currentRangeLeft KM",
                          fontSize: Dimensions.FONT_SIZE_XXLARGE,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black)
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: Dimensions.PADDING_SIZE_DEFAULT,
                    bottom: Dimensions.PADDING_SIZE_DEFAULT),
                child: const Divider(
                  height: 2,
                  color: AppColors.dividerGray,
                ),
              ),
              CustomRichText(
                spanText1: "${"buy_back_value".tr}: ",
                spanText2: " ₹ $buybackValueAfter3Year",
                color1: AppColors.darkGray,
                color2: AppColors.black,
                fontSize1: Dimensions.FONT_SIZE_XLARGE,
                fontSize2: Dimensions.FONT_SIZE_XLARGE,
              )
            ]));
  }

  _threeYearBuyBackValueCard({
    int? idealBuybackVehicleValue,
    int? buybackValueAfter3Year,
    int? idealMileage,
    int? mileageAfter3Year,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GuageCardView(
          idealBuyback: idealBuybackVehicleValue!,
          actualBuyback: buybackValueAfter3Year!,
          idealMileage: idealMileage!,
          actualMileage: mileageAfter3Year!,
          buttonAction: () {
            Utils.showBottomSheetWithMsg("buy_back_msg".tr);
          },
          header: "Buyback value",
          startRange: "0",
          endRange: "$idealBuybackVehicleValue",
          description:
              "The value that you get on selling the vehicle back to Turno after 3 years",
          centreValue: "₹ $buybackValueAfter3Year",
          centreText: "Current value",
          isSingleColour: false,
        ),
        GuageCardView(
          idealBuyback: idealBuybackVehicleValue,
          actualBuyback: buybackValueAfter3Year,
          idealMileage: idealMileage,
          actualMileage: mileageAfter3Year,
          buttonAction: () {
            Utils.showBottomSheetWithMsg("buy_back_msg".tr);
          },
          header: "Mileage",
          startRange: "0",
          endRange: "$idealMileage",
          description:
              "The value that you get on selling the vehicle back to Turno after 3 years",
          centreValue: "$mileageAfter3Year",
          centreText: "km/charge",
          isSingleColour: true,
        )
      ],
    );
  }

  _mileage(
      {required wasPreviousChargeMileageLow,
      required previousChargeMileage,
      required idealMileage}) {
    return Container(
      margin: const EdgeInsets.only(
          top: Dimensions.PADDING_SIZE_DEFAULT,
          bottom: Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              Dimensions.PADDING_SIZE_DEFAULT,
            ),
            child: CustomLabel(
                title: "mileage".tr,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontWeight: FontWeight.w600,
                color: AppColors.black),
          ),
          Visibility(
              visible: wasPreviousChargeMileageLow, child: _mileageAlertView()),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_LARGE,
                right: Dimensions.PADDING_SIZE_LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomLabel(
                          title: "on_previous_charge".tr,
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
                          height: 5,
                        ),
                        CustomLabel(
                            title: "km_charge".tr,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGray),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomLabel(
                            title: "others_are_getting".tr,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomLabel(
                            title: "97",
                            fontSize: Dimensions.FONT_SIZE_XXLARGE,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomLabel(
                            title: "km_charge".tr,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGray),
                        const SizedBox(
                          height: 8,
                        ),
                        PrefixIconTextView(
                          icon: Images.icon_good,
                          text: "Good".tr,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomLabel(
                    title: "note_charging_practice".tr,
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    maxLines: 3,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 2,
            color: AppColors.borderGray,
          ),
          CustomTextButton(
            title: 'best_charging_practices'.tr,
            textAlign: TextAlign.center,
            onTap: () {
              Get.toNamed(AppRoutes.BEST_PRACTICE);
            },
            showTrailingIcon: true,
            color: AppColors.darkBlue,
            borderColor: AppColors.borderGray,
            isBorderVisibile: false,
          ),
        ],
      ),
    );
  }

  _mileageAlertView() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Dimensions.PADDING_SIZE_DEFAULT,
      ),
      decoration: BoxDecoration(
          color: AppColors.paleYello,
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT,
            right: Dimensions.PADDING_SIZE_DEFAULT,
            top: Dimensions.PADDING_SIZE_LARGE,
            bottom: Dimensions.PADDING_SIZE_LARGE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Images.iconAlert),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLabel(
                    title: "last_charge_msg".tr,
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    maxLines: 3,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightBlack),
                Row(
                  children: const [
                    CustomLabel(
                        title: "23 km/ charge ",
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        maxLines: 3,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ],
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(
                    Dimensions.PADDING_SIZE_SMALL,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.borderGray,
                        width: 1,
                      )),
                  child: CustomLabel(
                      title: "get_help".tr,
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      maxLines: 3,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black)),
            )
          ],
        ),
      ),
    );
  }

  renderUI() {
    switch (controller.usedCaseScenarios.value) {
      case NetworkUsedCase.loading:
        return SizedBox(
          height: Constants.deviceHeight,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      case NetworkUsedCase.error:
        return SizedBox(
          height: Constants.deviceHeight,
          child:  Center(
            child: ErrorWidgetView(
              buttonAction:() {
                 controller.fetchVehicleData();
              },
            ),
          ),
        );
      case NetworkUsedCase.usernotfound:
        return SizedBox(
          height: Constants.deviceHeight,
          child: const Center(
            child: ComingSoon(),
          ),
        );
      case NetworkUsedCase.sucess:
        return Container(
          margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _vehicleSocAndCurrentBuyBackValue(
                  currentSoc: controller
                      .getVehicelDetails.value?.payload!.currentStateOfCharge,
                  currentRangeLeft: controller
                      .getVehicelDetails.value?.payload!.currentRangeLeft,
                  buybackValueAfter3Year: controller
                      .getVehicelDetails.value?.payload!.buybackValueAfter3Year,
                ),
                _mileage(
                  wasPreviousChargeMileageLow: controller.getVehicelDetails
                      .value?.payload!.wasPreviousChargeMileageLow,
                  previousChargeMileage: controller
                      .getVehicelDetails.value?.payload!.previousChargeMileage,
                  idealMileage:
                      controller.getVehicelDetails.value?.payload!.idealMileage,
                ),
                CustomLabel(
                  title: "3_years_return_value".tr,
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomLabel(
                  title: "3_years_calculation_desc".tr,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGray,
                ),
                const SizedBox(
                  height: 20,
                ),
                _threeYearBuyBackValueCard(
                  idealBuybackVehicleValue: controller.getVehicelDetails.value
                      ?.payload!.idealBuybackVehicleValue,
                  buybackValueAfter3Year: controller
                      .getVehicelDetails.value?.payload!.buybackValueAfter3Year,
                  idealMileage:
                      controller.getVehicelDetails.value?.payload!.idealMileage,
                  mileageAfter3Year: controller
                      .getVehicelDetails.value?.payload!.mileageAfter3Year,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomLabel(
                    title: "note_charging_practice".tr,
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    maxLines: 3,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
                const SizedBox(
                  height: 15,
                ),
                CustomTextButton(
                  title: 'best_charging_practices'.tr,
                  textAlign: TextAlign.center,
                  onTap: () {
                    Get.toNamed(AppRoutes.BEST_PRACTICE);
                  },
                  showTrailingIcon: true,
                  borderColor: AppColors.darkBlue,
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
        );
      default:
        SizedBox(
          height: Constants.deviceHeight,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
