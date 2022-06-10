import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/domain/usecases/auth/otp_usecase.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_controller.dart';
import '../../../app/services/local_storage.dart';

class OtpController extends GetxController {
  OtpController(this.otpUseCase);
  final OtpUseCase otpUseCase;
  final store = Get.find<LocalStorageService>();
  TextEditingController otpController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();

  var count = 60;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  verifyOtp(String mobile, String otp) async {
    try {
      final response = await otpUseCase.execute(Tuple2(mobile, otp));
      debugPrint(response.toString());
      if (response.status == 'success') {
        store.isLoggedIn = true;
        Get.offAllNamed(AppRoutes.LANDING_PAGE);
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

  logout() {
    store.user = null;
    store.isLoggedIn = false;
    Get.offAll(AppRoutes.LOGIN);
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else {
        _timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    count = 59;
    update();
  }

  @override
  onClose() {
    /*  otpController.dispose();
    loginController.dispose();*/
    super.onClose();
  }
}
