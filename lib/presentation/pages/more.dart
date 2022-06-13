import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/controllers/more/more_controller.dart';
import '../../app/config/dimentions.dart';
import '../widgets/custom_label.dart';

class More extends GetView<MoreController> {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGray,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _moreItem(
                itemName: "vehicle_catalogue".tr,
                itemIcon: Icons.car_repair,
                onClick: () {
                  debugPrint("vehicle");
                }),
            _moreItem(
                itemName: "apply_loan".tr,
                itemIcon: Icons.account_balance,
                onClick: () {
                  print("loan");
                }),
            _moreItem(
                itemName: "vehicle_stats".tr,
                itemIcon: Icons.stacked_bar_chart,
                onClick: () {}),
            _moreItem(
                itemName: "choose_language".tr,
                itemIcon: Icons.language,
                onClick: () {}),
            _moreItem(
                itemName: "refer_earn".tr,
                itemIcon: Icons.people_alt_sharp,
                onClick: () {}),
            _moreItem(
                itemName: "rewards".tr, itemIcon: Icons.money, onClick: () {}),
            _moreItem(
                itemName: "logout".tr, itemIcon: Icons.logout, onClick: () {}),
          ],
        ))));
  }

  _moreItem(
      {required String itemName,
      required IconData itemIcon,
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
            Icon(itemIcon),
            const SizedBox(
              width: 15,
            ),
            CustomLabel(
                title: itemName,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
