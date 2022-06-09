import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/domain/usecases/auth/login_usecase.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);
  final LoginUseCase _loginUseCase;
  TextEditingController phoneController = TextEditingController();
  String phoneNumber = '';

  @override
  void onReady() {
    super.onReady();
  }

  @override
  onClose() {
    phoneController.dispose();
    super.onClose();
  }

  String get getPhoneNumber {
    return phoneNumber;
  }

  set setPhoneNumber(String number) {
    debugPrint(number);
    phoneNumber = number;
  }

  signUpWith(String mobile) async {
    try {
      final response = await _loginUseCase.execute(mobile);
      print(response.status);
      if (response.status == 'success') {
        Get.toNamed(AppRoutes.OTP);
      } else {
        Get.defaultDialog(
          title: 'Oh no!',
          middleText: response.message.toString(),
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
    } catch (error) {}
  }
}
