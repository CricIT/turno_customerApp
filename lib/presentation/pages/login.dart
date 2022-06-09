// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_button.dart';
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
                _buildLoginText(),
                _buildCarouselSlider(),
                _otpText(),
                _buildPhoneInputField(),
                const Spacer(),
                _nextButton(),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'login'.tr,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          aspectRatio: 1.5,
          padEnds: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
        items: imageSliders,
      ),
    );
  }

  Widget _otpText() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'login_1'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: 'login_2'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: 'login_3'.tr,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
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
                child: Text('ok'.tr),
              ),
            ],
          );
        }
      },
      child: Center(
        child: Text(
          "next".tr.toUpperCase(),
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  final List<Widget> imageSliders = Constants.loginPageImages
      .map(
        (item) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: Stack(
            children: [
              Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            ],
          ),
        ),
      )
      .toList();
}
