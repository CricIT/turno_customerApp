// ignore_for_file: deprecated_member_use, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_controller.dart';
import '../../app/config/constant.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class OtpScreen extends GetView<OtpController> {
  OtpScreen({Key? key}) : super(key: key);
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            _buildHeaderImage(context),
            const SizedBox(height: 8),
            _buildHeaderText(),
            _buildHeaderSubText(),
            const SizedBox(
              height: 20,
            ),
            _buildOtpInput(context),
            const SizedBox(
              height: 20,
            ),
            _buildResendOtp(),
            const SizedBox(
              height: 14,
            ),
            _buildVerifyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(Constants.otpGifImage),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        'phone_verification'.tr,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHeaderSubText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: 'enter_code'.tr,
          children: [
            TextSpan(
              text: controller.loginController.phoneController.text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOtpInput(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: PinCodeTextField(
          autoFocus: true,
          controller: controller.otpController,
          appContext: context,
          pastedTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return "invalid_otp".tr;
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              disabledColor: Colors.white,
              errorBorderColor: Colors.black,
              inactiveColor: Colors.white70,
              selectedColor: Colors.white,
              selectedFillColor: Colors.white,
              activeColor: Colors.white,
              inactiveFillColor: Colors.white),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: errorController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          beforeTextPaste: (text) {
            return true;
          },
          onChanged: (String value) {},
        ),
      ),
    );
  }

  Widget _buildResendOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "code_not_get".tr,
          style: TextStyle(
            color: AppColors.subTextColor,
            fontSize: 15,
          ),
        ),
        GetBuilder<OtpController>(
          builder: (_) {
            return controller.count > 0
                ? Text(
                    '${controller.count} sec',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      Get.snackbar(
                        'alert'.tr,
                        'otp_resent'.tr,
                        backgroundColor: AppColors.primaryColorLight,
                        colorText: AppColors.whiteColor,
                      );
                      controller.resetTimer();
                      controller.startTimer();
                      controller.loginController.signUpWith(
                        controller.loginController.phoneController.text,
                      );
                    },
                    child: Text(
                      "resend".tr,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return CustomButton(
      buttonAction: () {
        if (controller.otpController.text.length != 6) {
          errorController!.add(ErrorAnimationType.shake);
        } else {
          controller.verifyOtp(
            controller.loginController.phoneController.text,
            controller.otpController.text,
          );
        }
      },
      child: Center(
        child: Text(
          "verify".tr.toUpperCase(),
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
