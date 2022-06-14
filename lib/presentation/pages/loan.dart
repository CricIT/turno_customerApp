import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
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
              _buildEmiReminder(context),
              _buildOutstandingBox(context),
              _buildLoanDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmiReminder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Dimensions.PADDING_SIZE_SMALL,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderGray,
          ),
          color: AppColors.lightGray),
      height: MediaQuery.of(context).size.height * 0.09,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CustomLabel(
                title: 'You have one EMI coming up',
                color: AppColors.black,
              ),
              Spacer(),
              Icon(Icons.close),
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

  Widget _buildOutstandingBox(BuildContext context) {
    return Container();
  }

  Widget _buildLoanDetails(BuildContext context) {
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
      height: MediaQuery.of(context).size.height * 0.15,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _loanDetailsItemWidget(context, 'Total loan', 'Rs. 5,00,000'),
            const SizedBox(
              width: 100,
            ),
            _loanDetailsItemWidget(context, 'Interest rate', '14% per annum'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _loanDetailsItemWidget(context, 'Started from', '1 Apr 2022'),
            const SizedBox(
              width: 110,
            ),
            _loanDetailsItemWidget(context, 'Down payment', 'Rs. 20,000'),
          ],
        ),
      ]),
    );
  }

  Widget _loanDetailsItemWidget(
      BuildContext context, String title, String subtitle) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.045,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(
            title: title,
            color: AppColors.placeholderColor,
            fontSize: 12,
          ),
          CustomLabel(
            title: subtitle,
            color: AppColors.blackColor,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
