import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/domain/usecases/auth/login_usecase.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);
  final LoginUseCase _loginUseCase;
  TextEditingController phoneController = TextEditingController();
  String _phoneNumber = '';

  @override
  void onReady() {
    super.onReady();
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
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(10),
      title: 'Oh no!',
      middleText: message,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('OK'),
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
      Get.to(AppRoutes.ERROR);
    }
  }

  @override
  onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
