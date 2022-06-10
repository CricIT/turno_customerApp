import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/controllers/more/more_controller.dart';
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

                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "vehicle_catalogue".tr,
                          itemIcon: Icons.car_repair),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "apply_loan".tr,
                          itemIcon: Icons.account_balance),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "vehicle_stats".tr,
                          itemIcon: Icons.stacked_bar_chart),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "choose_language".tr,
                          itemIcon: Icons.language),
                    ),

                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "refer_earn".tr,
                          itemIcon: Icons.people_alt_sharp),
                    ),

                    InkWell(
                      onTap: () {

                      },
                      child: _moreItem(
                          itemName: "rewards".tr,
                          itemIcon: Icons.money),
                    ),
                    InkWell(
                      onTap:() {

                      },
                      child: _moreItem(
                          itemName: "logout".tr,
                          itemIcon: Icons.logout),
                    ),
                  ],
                ))));
  }

  _moreItem({required String itemName, required IconData itemIcon}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      padding:const EdgeInsets.all(20.0),
      color: Colors.white,
      child: Row(
        children: [
          Icon(itemIcon),
          const SizedBox(
            width: 15,
          ),
          CustomLabel(title: itemName,fontSize: 16,fontWeight: FontWeight.w500)
        ],
      ),
    );
  }
}
