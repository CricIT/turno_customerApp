import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/domain/usecases/auth/login_usecase.dart';
import 'package:turno_customer_application/presentation/widgets/error.dart';

import '../../../app/util/util.dart';
import '../../widgets/custom_label.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);
  final LoginUseCase _loginUseCase;
  TextEditingController phoneController = TextEditingController();
  String _phoneNumber = '';

  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/LoginScreen');
  }

  String get getPhoneNumber {
    return _phoneNumber;
  }

  set setPhoneNumber(String number) {
    debugPrint(number);
    _phoneNumber = number;
  }

  _showErrorMessage(String message) {
    print(message);
    Utils.showAlertDialog(
      title: 'alert'.tr,
      message: message,
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
          },
          child: CustomLabel(
            title: 'ok'.tr,
          ),
        ),
      ],
    );
  }

  signUpWith(String mobile) async {
    try {
      final response = await _loginUseCase.execute(mobile);
      response.fold(
          (l) => _showErrorMessage(l), (r) => Get.toNamed(AppRoutes.OTP));
    } catch (error) {
      Get.to(ErrorView(
        buttonAction: () {
          Get.back();
        },
      ));
    }
  }

  @override
  onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
