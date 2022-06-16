import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/constant.dart';
import 'custom_button.dart';
import 'custom_label.dart';

class ErrorWidgetView extends StatelessWidget {
  const ErrorWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Constants.deviceWidth,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/error.png',
                    fit: BoxFit.cover,
                  ),
                ),
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
