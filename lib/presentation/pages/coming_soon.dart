import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_label.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: Constants.deviceWidth,
                height: Constants.deviceHeight * 0.6,
                child: Image.asset(
                  'assets/images/coming_soon.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: Constants.deviceHeight * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: CustomLabel(
                  title: 'This feature is coming soon',
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Constants.deviceHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  width: Constants.deviceWidth * 0.95,
                  buttonAction: () {
                    Get.back();
                  },
                  child: const CustomLabel(
                    title: 'Back',
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
