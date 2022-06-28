import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/app/util/util.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import 'package:turno_customer_application/presentation/widgets/error_widget.dart';
import '../../app/constants/network_used_case.dart';
import '../../domain/entities/loan.dart';
import '../controllers/loan/loan_controller.dart';
import '../widgets/coming_soon.dart';

class LoanView extends GetView<LoanController> {
  const LoanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (builder) {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.fetchLoanDetails,
          header: const WaterDropHeader(),
          child: SingleChildScrollView(
            child: renderUI(),
          ),
        );
      },
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
            title: 'my_loan_details'.tr,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
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
          child: Center(
            child: ErrorWidgetView(
              buttonAction: () {
                controller.fetchLoanDetails();
              },
            ),
          ),
        );
      case NetworkUsedCase.usernotfound:
        return SizedBox(
          height: Constants.deviceHeight,
          child: Center(
            child: ComingSoon(
              showButton: false,
            ),
          ),
        );

      case NetworkUsedCase.sucess:
        return Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                const Divider(),
                _buildEmiReminder(
                    controller.getLoanDetails.value?.payload?.upcomingEmi),
                _buildOutstandingBox(
                    amount:
                        controller.getLoanDetails.value?.payload?.loanAmount,
                    tenure: controller
                        .getLoanDetails.value?.payload?.loanTenureInYears),
                _buildLoanDetails(
                    outStandingAmount: controller
                        .getLoanDetails.value?.payload?.outstandingAmount,
                    emiAmount:
                        controller.getLoanDetails.value?.payload?.emiAmount,
                    startDate: controller
                        .getLoanDetails.value?.payload?.loanStartDateInMs,
                    endDate: controller
                        .getLoanDetails.value?.payload?.loanEndDateInMs),
                _buildPaymentHistoryBox(
                  emiHistory:
                      controller.getLoanDetails.value?.payload?.emiHistory,
                ),
              ],
            ),
          ),
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

  Widget _buildEmiReminder(UpcomingEmi? emi) {
    return Container(
      padding: EdgeInsets.all(Constants.deviceHeight * 0.01),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderGray,
          ),
          color: AppColors.paleYello),
      height: Constants.deviceHeight * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLabel(
            title: 'emi_coming_up'.tr,
            color: AppColors.black,
          ),
          Row(
            children: [
              CustomLabel(
                  title: '₹ ${emi?.amount == null ? "" : emi?.amount}',
                  color: AppColors.black),
              const Spacer(),
              CustomLabel(
                  title:
                      "${'due_date'.tr} : ${emi?.dateInMs == null ? "" : Utils.convertDate(emi?.dateInMs)}",
                  color: AppColors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutstandingBox(
      {required double? amount, required double? tenure}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(Constants.deviceHeight * 0.01),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        border: Border.all(
          color: AppColors.borderGray,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: Constants.deviceHeight * 0.1,
      width: Constants.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLabel(
            title: amount == null ? "" : '₹ $amount',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
          CustomLabel(
            title:
                "${'loan_taken_for'.tr} ${tenure == null ? "" : Utils.checkIfTheDecimalIsGreaterThanZero(tenure.toString()) ? tenure : tenure.toString().substring(0, 1)} ${'years'.tr}",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}

Widget _buildLoanDetails({
  double? outStandingAmount,
  double? emiAmount,
  int? startDate,
  int? endDate,
}) {
  return Container(
    padding: EdgeInsets.all(Constants.deviceHeight * 0.01),
    margin: const EdgeInsets.symmetric(
      vertical: 20,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppColors.borderGray,
      ),
    ),
    height: Constants.deviceHeight * 0.16,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          _loanDetailsItemWidget('outstanding_amount'.tr,
              outStandingAmount == null ? "" : '₹ $outStandingAmount'),
          const Spacer(),
          _loanDetailsItemWidget(
              'emi_amount'.tr, emiAmount == null ? "" : '₹ $emiAmount'),
        ],
      ),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loanDetailsItemWidget('started_from'.tr,
              startDate == null ? "" : Utils.convertDate(startDate)),
          const Spacer(),
          _loanDetailsItemWidget('ending_at'.tr,
              endDate == null ? "" : Utils.convertDate(endDate)),
        ],
      ),
    ]),
  );
}

Widget _loanDetailsItemWidget(String title, String subtitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomLabel(
        title: title,
        color: AppColors.placeholderColor,
        fontSize: 12,
      ),
      SizedBox(
        width: Constants.deviceWidth * 0.25,
      ),
      Text(
        subtitle,
        style: lightBlackBold16,
      ),
    ],
  );
}

Widget _buildPaymentHistoryBox({EmiHistory? emiHistory}) {
  return Container(
    height: Constants.deviceHeight * 0.26,
    width: Constants.deviceWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppColors.borderGray,
      ),
    ),
    padding: EdgeInsets.all(Constants.deviceHeight * 0.01),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'total_amount_paid'.tr,
            style: lightBlackBold16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: CustomLabel(
            title:
                '₹ ${emiHistory?.totalAmountPaid == null ? "" : emiHistory?.totalAmountPaid}',
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: emiHistory == null ? 0 : emiHistory.emiHistory?.length,
            itemBuilder: (context, index) => _buildEmiPaymentCard(
              date: emiHistory?.emiHistory?[index].dateInMs == null
                  ? ""
                  : Utils.convertDate(emiHistory?.emiHistory?[index].dateInMs),
              amount: emiHistory?.emiHistory?[index].amount == null
                  ? ""
                  : '${emiHistory?.emiHistory?[index].amount}',
              index: index + 1,
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.PAYMENT_HISTORY);
            TrackHandler.trackEvent(eventName: 'ViewHistoryClicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLabel(title: 'view_history'.tr),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildEmiPaymentCard({
  required String date,
  required String amount,
  required int index,
}) {
  return SizedBox(
    width: Constants.deviceWidth * 0.9,
    height: Constants.deviceHeight * 0.09,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              date,
              style: blackNormal14,
            ),
            const Spacer(),
            SizedBox(
              width: Constants.deviceWidth * 0.25,
              height: Constants.deviceHeight * 0.04,
              child: Row(
                children: [
                  Text(amount),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          '${'emi'.tr}-$index',
          style: lightBlackNormal12,
        ),
        const Divider(),
      ],
    ),
  );
}
