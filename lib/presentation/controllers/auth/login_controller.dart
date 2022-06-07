import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/domain/usecases/auth/login_usecase.dart';

class LoginController extends GetxController {
  LoginController(this._loginUseCase);
  final LoginUseCase _loginUseCase;

  @override
  void onInit() {
    super.onInit();
  }

  signUpWith(String mobile) async {
    try {
      final response = await _loginUseCase.execute(mobile);
      debugPrint(response);
    } catch (error) {}
  }
}
