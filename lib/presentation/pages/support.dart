import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/presentation/controllers/support/support_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_button.dart';

import '../../app/config/app_colors.dart';
import '../widgets/custom_label.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: controller,
        builder: (builder) {
          return SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.fetchSupportDetails,
            header: const WaterDropHeader(),
            child: SingleChildScrollView(
              child: _renderUI(),
            ),
          );
        });
  }

  _renderUI() {
    return Container(
      padding: const EdgeInsets.all(14),
      width: Constants.deviceWidth,
      color: Colors.white,
      child: Column(
        children: [
          _buildHeader(),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(Constants.deviceHeight * 0.04),
            child: Image.asset('assets/images/support.png'),
          ),
          _buildDescription(),
          SizedBox(
            height: Constants.deviceHeight * 0.1,
          ),
          _buildCallButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: Constants.deviceHeight * 0.07,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: Constants.deviceHeight * 0.017),
          child: CustomLabel(
            title: 'help_and_support'.tr,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Constants.deviceHeight * 0.025,
            ),
            child: Text(
              'facing_issues'.tr,
              style: lightBlackBold16,
            ),
          ),
          _buildSupportDesc('problems_in_vehicle'.tr),
          _buildSupportDesc('mileage_issues'.tr),
          _buildSupportDesc('loan_queries'.tr),
        ],
      ),
    );
  }

  Widget _buildCallButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: CustomButton(
        width: Constants.deviceWidth,
        buttonAction: () {
          controller.getSupportDetails;
        },
        child: CustomLabel(
          title: 'call_for_free'.tr,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _buildSupportDesc(String title) {
    return Padding(
      padding: EdgeInsets.all(
        Constants.deviceHeight * 0.01,
      ),
      child: Text(
        ' - ${title.tr}',
        style: blackNormal14,
      ),
    );
  }
}
