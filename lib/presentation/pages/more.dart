import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/more_controller.dart';
import '../../app/config/dimentions.dart';
import '../../app/constants/images.dart';
import '../widgets/custom_label.dart';

class More extends GetView<MoreController> {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_XLARGE),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _moreItem(
                itemName: "vehicle_catalogue".tr,
                itemIcon: Images.icon_vehicle_catalog,
                onClick: () {
                  Get.toNamed(AppRoutes.VEHICLE_CATALOUGE);
                }),
            _moreItem(
                itemName: "apply_loan".tr,
                itemIcon: Images.icon_loan_application,
                onClick: () {
                  Get.toNamed(AppRoutes.NEW_LOAN);
                }),
            _moreItem(
                itemName: "choose_language".tr,
                itemIcon: Images.icon_language,
                onClick: () {
                  Get.toNamed(AppRoutes.LANGUAGE);
                }),
            _moreItem(
                itemName: "refer_earn".tr,
                itemIcon: Images.icon_refer,
                onClick: () {
                  Get.toNamed(AppRoutes.REFER_AND_EARN);
                }),
            _moreItem(
                itemName: "rewards".tr,
                itemIcon: Images.icon_rewards,
                onClick: () {
                  Get.toNamed(AppRoutes.COMING_SOON);
                }),
            _moreItem(
                itemName: "logout".tr,
                itemIcon: Images.icon_logout,
                onClick: () {
                  controller.logout();
                }),
          ],
        ),
      ),
    );
  }

  _moreItem(
      {required String itemName,
      required String itemIcon,
      required Function onClick}) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        color: Colors.white,
        child: Row(
          children: [
            SvgPicture.asset(itemIcon),
            const SizedBox(
              width: 15,
            ),
            CustomLabel(
                title: itemName,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontWeight: FontWeight.w400)
          ],
        ),
      ),
    );
  }
}
