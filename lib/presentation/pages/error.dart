import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/presentation/widgets/custom_button.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import 'package:get/get.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/error.png'),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomLabel(
                  title: 'Oops! \n Something went wrong',
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomLabel(
                  title: 'We are working to solve it',
                  textAlign: TextAlign.center,
                  fontSize: 22,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  width: Constants.deviceWidth * 0.8,
                  buttonAction: () {
                    Get.back();
                  },
                  child: const CustomLabel(
                    title: 'Retry',
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
