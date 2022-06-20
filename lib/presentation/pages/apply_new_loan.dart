import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:turno_customer_application/presentation/controllers/more/new_loan_controller.dart';

import '../../app/config/app_colors.dart';
import '../widgets/coming_soon.dart';

class ApplyNewLoan extends GetView<NewLoanController> {
  const ApplyNewLoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: controller.isDataAvailable
              ? Container()
              : ComingSoon(
                  showButton: true,
                ),
        ));
  }
}
