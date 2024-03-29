// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';
import '../../../app/config/constant.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            _buildBackButton(),
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
      child: CustomLabel(
        title: 'phone_verification'.tr,
        fontWeight: FontWeight.bold,
        fontSize: Dimensions.FONT_SIZE_XXLARGE,
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
              text: controller.loginController.getPhoneNumber,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: Constants.poppins,
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
          useExternalAutoFillGroup: true,
          autoFocus: true,
          controller: controller.otpController,
          appContext: context,
          pastedTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: Constants.poppins,
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
          errorAnimationController: controller.errorController,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "code_not_get".tr,
          style: const TextStyle(
            color: AppColors.subTextColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 2,
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
                      controller.initOtpListening();
                      controller.loginController.signUpWith(
                        controller.loginController.getPhoneNumber,
                      );
                    },
                    child: Text(
                      "resend".tr,
                      style: const TextStyle(
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
          controller.errorController!.add(ErrorAnimationType.shake);
        } else {
          controller.verifyOtp(
            controller.loginController.getPhoneNumber,
            controller.otpController.text,
          );
        }
      },
      child: Center(
        child: CustomLabel(
          title: "verify".tr.toUpperCase(),
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios)),
    );
  }
}
