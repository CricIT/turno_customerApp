import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/app/util/util.dart';
import 'package:turno_customer_application/domain/entities/emi.dart';
import 'package:turno_customer_application/domain/entities/emi_history.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/presentation/pages/error.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import 'package:turno_customer_application/presentation/widgets/error_widget.dart';
import '../controllers/landing_page/loan_controller.dart';

class LoanView extends GetView<LoanController> {
  const LoanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Loan>(
          future: controller.myLoanDetails,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                print('noooooooooo cooneerrccctionnn');
                return const Center(
                  child: Text('No connection'),
                );
              case ConnectionState.waiting:
                print('wwwaaaatttiiinnnnggggggg');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                print('acccctttitiiiiivvvveeeee');
                break;
              case ConnectionState.done:
                print('dddooonnnnneeeeeee');
                if (snapshot.hasData && snapshot.data != null) {
                  print('ddaaaatttttaaaaaa ${snapshot.data}');
                  return Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeader(),
                          const Divider(),
                          _buildEmiReminder(snapshot.data?.upcomingEMI),
                          _buildOutstandingBox(
                            amount: snapshot.data?.loanAmount,
                            tenure: snapshot.data?.loanTenure,
                          ),
                          _buildLoanDetails(
                            outStandingAmount: snapshot.data?.outStandingAmount,
                            emiAmount: snapshot.data?.emiAmount,
                            startDate: snapshot.data?.loanStartDate,
                            endDate: snapshot.data?.loanEndDate,
                          ),
                          _buildPaymentHistoryBox(
                            emiHistory: snapshot.data?.emiHistory,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const ErrorWidgetView();
                }
            }
            return Container();
          }),
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

  Widget _buildEmiReminder(EMI? emi) {
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
          CustomLabel(
            title: 'You have one EMI coming up'.tr,
            color: AppColors.black,
          ),
          Row(
            children: [
              CustomLabel(title: '₹ ${emi?.amount}', color: AppColors.black),
              const Spacer(),
              CustomLabel(
                  title: 'Due Date : ${Utils.convertDate(emi?.dueDate)}',
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
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
        color: AppColors.borderGray,
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
            title: '₹ $amount',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          CustomLabel(
            title: 'Loan taken for ${tenure.toString().substring(0, 1)} years',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
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
          _loanDetailsItemWidget('Outstanding amount', '₹ $outStandingAmount'),
          SizedBox(
            width: Constants.deviceWidth * 0.25,
          ),
          _loanDetailsItemWidget('EMI amount', '₹ $emiAmount'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _loanDetailsItemWidget('Started from', Utils.convertDate(startDate)),
          SizedBox(
            width: Constants.deviceWidth * 0.27,
          ),
          _loanDetailsItemWidget('Ending at', Utils.convertDate(endDate)),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: CustomLabel(
            title: '₹ ${emiHistory?.totalAmountPaid}',
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: emiHistory?.emiHistory.length,
            itemBuilder: (context, index) => _buildEmiPaymentCard(
              date: Utils.convertDate(emiHistory?.emiHistory[index].dueDate),
              amount: '${emiHistory?.emiHistory[index].amount}',
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
          'EMI-$index',
          style: lightBlackNormal12,
        ),
        const Divider(),
      ],
    ),
  );
}
