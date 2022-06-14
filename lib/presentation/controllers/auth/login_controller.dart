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

  signUpWith(String mobile) async {
    try {
      final response = await _loginUseCase.execute(mobile);
      debugPrint(response.toString());
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
    } catch (error) {
      print(error);
    }
  }

  @override
  onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
