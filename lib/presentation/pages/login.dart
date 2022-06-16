// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_button.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import 'package:turno_customer_application/presentation/widgets/custom_text_field.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeaderImage(),
                _buildLoginText(),
                _otpText(),
                _buildPhoneInputField(),
                SizedBox(
                  height: Constants.deviceHeight * 0.2,
                ),
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Center(
        child: CustomLabel(
          title: 'login'.tr.toUpperCase(),
          color: AppColors.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Image.asset(Constants.loginPageImage);
  }

  Widget _otpText() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        child: Text(
          'login_text'.tr,
          textAlign: TextAlign.center,
          style: blackNormal14,
        ));
  }

  Widget _buildPhoneInputField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      child: CustomTextField(
        textController: controller.phoneController,
        keyboardInputType: TextInputType.phone,
        prefixText: '+91',
        hintText: "enter_number".tr,
      ),
    );
  }

  Widget _nextButton() {
    return CustomButton(
      buttonAction: () {
        if (controller.phoneController.text.length == 10) {
          controller.setPhoneNumber = controller.phoneController.text;
          controller.signUpWith(controller.phoneController.text);
        } else {
          Get.defaultDialog(
            title: 'alert'.tr,
            middleText: 'ten_digit'.tr,
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: CustomLabel(
                    title: 'ok'.tr,
                  )),
            ],
          );
        }
      },
      child: Center(
        child: CustomLabel(
          title: "next".tr.toUpperCase(),
          color: AppColors.whiteColor,
          fontSize: Dimensions.FONT_SIZE_XLARGE,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
