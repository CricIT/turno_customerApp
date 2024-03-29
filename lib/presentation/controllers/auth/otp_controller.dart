import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:telephony/telephony.dart';
import 'package:tuple/tuple.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/domain/usecases/auth/otp_usecase.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_controller.dart';
import '../../../app/core/tracker/tracker.dart';
import '../../../app/services/local_storage.dart';
import '../../../app/util/util.dart';
import '../../widgets/error.dart';
import '../../widgets/custom_label.dart';

class OtpController extends GetxController {
  OtpController(this.otpUseCase);
  final OtpUseCase otpUseCase;
  final store = Get.find<LocalStorageService>();
  TextEditingController otpController = TextEditingController(text: "");
  StreamController<ErrorAnimationType>? errorController;

  final LoginController loginController = Get.find<LoginController>();
  String? _otpCode = "";
  final intRegex = RegExp("\\d{6}", multiLine: true);
  final telephony = Telephony.instance;

  var count = 60;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
    initOtpListening();
    TrackHandler.trackScreen(screenName: '/OtpScreen');
  }

  verifyOtp(String mobile, String otp) async {
    try {
      final response = await otpUseCase.execute(Tuple2(mobile, otp));
      debugPrint(response.toString());
      if (response.status == 'success') {
        store.isLoggedIn = true;
        store.mobileNumber = mobile;
        TrackHandler.setUser(
          userId: mobile,
          mobile: mobile,
        );
        store.isFirstTimeSetUp = true;
        debugPrint(store.getLanguage);
        TrackHandler.setUserLanguage(lang: store.getLanguage!);

        Get.offAllNamed(AppRoutes.LANDING_PAGE);
      } else {
        Utils.showAlertDialog(
          title: 'alert'.tr,
          message: response.message.toString(),
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
    } catch (error) {
      Get.to(ErrorView(
        buttonAction: () {
          Get.back();
        },
      ));
    }
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

  Future<void> initOtpListening() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: (SmsMessage sms) {
            String address = sms.address.toString();
            String message = sms.body.toString();
            if (address.contains('BLBLLE') && message.contains('OTP')) {
              try {
                RegExpMatch? match = intRegex.firstMatch(message);
                _otpCode = match?.group(0);
                otpController.text = _otpCode.toString();
              } catch (e) {
                printError();
              }

              update();
            }
          },
          listenInBackground: false);
    }
  }

  @override
  onClose() {
    /*  otpController.dispose();
    loginController.dispose();*/
    super.onClose();
  }
}
