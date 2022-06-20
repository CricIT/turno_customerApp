

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/app/util/util.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/presentation/controllers/loan_controller/loan_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import '../../domain/entities/emi_history.dart';
import '../widgets/generic_appbar.dart';


class PaymentHistory extends GetView<LoanController> {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: GenericAppBar(heading: "Payment History")),
        body: FutureBuilder<Loan>(
            future: controller.myLoanDetails,
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      _buildTopContainer(
                          amount:
                              '${snapshot.data?.emiHistory?.totalAmountPaid}'),
                      _buildPaymentList(snapshot.data?.emiHistory),
                    ],
                  ),
                ),
              );
            }));
  }

  Widget _buildTopContainer({required String amount}) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLabel(
            title: 'Total amount paid',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          CustomLabel(
            title: amount,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          )
        ],
      ),
    );
  }

  Widget _buildPaymentList(EmiHistory? emiHistory) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: Constants.deviceHeight * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListView.builder(
        itemCount: emiHistory?.emiHistory.length,
        itemBuilder: (context, index) => _buildEmiPaymentCard(
          date: Utils.convertDate(emiHistory?.emiHistory[index].dueDate),
          amount: '${emiHistory?.emiHistory[index].amount}',
          index: index + 1,
        ),
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
}
