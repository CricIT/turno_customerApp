import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:turno_customer_application/domain/usecases/auth/otp_usecase.dart';

import '../../../app/services/local_storage.dart';

class OtpController extends GetxController {
  OtpController(this.otpUseCase);
  final OtpUseCase otpUseCase;
  var isLoggedIn = false.obs;
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = store.user != null;
  }

  verifyOtp(String mobile, String otp) async {
    try {
      await otpUseCase.execute(Tuple2(mobile, otp));
      isLoggedIn.value = true;
      isLoggedIn.refresh();
    } catch (error) {}
  }
}
