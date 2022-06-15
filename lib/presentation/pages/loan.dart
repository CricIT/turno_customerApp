import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

import '../controllers/landing_page/loan_controller.dart';

class Loan extends GetView<LoanController> {
  const Loan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader(),
              const Divider(),
              _buildEmiReminder(),
              _buildOutstandingBox(amount: 'Rs. 5,00,000'),
              _buildLoanDetails(),
              _buildPaymentHistoryBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: Constants.deviceHeight * 0.07,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 12),
          child: CustomLabel(
            title: 'My loan details',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildEmiReminder() {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.PADDING_SIZE_DEFAULT,
      ),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderGray,
          ),
          color: AppColors.lightGray),
      height: Constants.deviceHeight * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomLabel(
                title: 'You have one EMI coming up'.tr,
                color: AppColors.black,
              ),
              const Spacer(),
              const Icon(Icons.close),
            ],
          ),
          Row(
            children: const [
              CustomLabel(title: 'Rs. 120000', color: AppColors.black),
              Spacer(),
              CustomLabel(
                  title: 'Due Date : 10 Jun 2022', color: AppColors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutstandingBox({required String amount}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
          color: AppColors.borderGray,
          border: Border.all(
            color: AppColors.borderGray,
          ),
          borderRadius: BorderRadius.circular(15)),
      height: Constants.deviceHeight * 0.1,
      width: Constants.deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLabel(
            title: amount,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          const CustomLabel(
            title: 'Loan taken for 2 years',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}

Widget _buildLoanDetails() {
  return Container(
    padding: const EdgeInsets.all(
      Dimensions.PADDING_SIZE_DEFAULT,
    ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loanDetailsItemWidget('Outstanding amount', 'Rs. 4,20,000'),
          SizedBox(
            width: Constants.deviceWidth * 0.25,
          ),
          _loanDetailsItemWidget('EMI amount', 'Rs. 20,000'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loanDetailsItemWidget('Started from', '1 Apr 2022'),
          SizedBox(
            width: Constants.deviceWidth * 0.33,
          ),
          _loanDetailsItemWidget('Ending at', '31 Mar 2024'),
        ],
      ),
    ]),
  );
}

Widget _loanDetailsItemWidget(String title, String subtitle) {
  return SizedBox(
    height: Constants.deviceHeight * 0.05,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(
          title: title,
          color: AppColors.placeholderColor,
          fontSize: 12,
        ),
        Text(
          subtitle,
          style: lightBlackBold16,
        ),
      ],
    ),
  );
}

Widget _buildPaymentHistoryBox() {
  return Container(
    height: Constants.deviceHeight * 0.42,
    width: Constants.deviceWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppColors.borderGray,
      ),
    ),
    padding: const EdgeInsets.all(
      Dimensions.PADDING_SIZE_DEFAULT,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Total Amount paid',
            style: lightBlackBold16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: CustomLabel(
            title: 'Rs. 60,000',
            color: AppColors.black,
            fontSize: 18,
          ),
        ),

        //need to be changed
        SizedBox(
          height: Constants.deviceHeight * 0.24,
          child: Column(
            children: [
              _buildEmiPaymentCard(
                date: '5 Jun 2022',
                amount: 'Rs. 20,000',
                modeOfPayment: 'Debit Card',
                index: 3,
              ),
              _buildEmiPaymentCard(
                date: '5 May 2022',
                amount: 'Rs. 20,000',
                modeOfPayment: 'UPI',
                index: 2,
              ),
              _buildEmiPaymentCard(
                date: '5 Apr 2022',
                amount: 'Rs. 20,000',
                modeOfPayment: 'NetBanking',
                index: 1,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.PAYMENT_HISTORY);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomLabel(title: 'View History'),
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
  required String modeOfPayment,
  required int index,
}) {
  return SizedBox(
    width: Constants.deviceWidth * 0.9,
    height: Constants.deviceHeight * 0.08,
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
          'EMI-$index   \u2022   Paid via $modeOfPayment',
          style: lightBlackNormal12,
        ),
        const Divider(),
      ],
    ),
  );
}
