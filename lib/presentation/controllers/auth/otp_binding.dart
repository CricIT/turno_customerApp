import 'package:get/get.dart';
import 'package:turno_customer_application/domain/usecases/auth/otp_usecase.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_controller.dart';

import '../../../data/repositories/otp_repository.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpUseCase(Get.find<OtpRepositoryIml>()));
    Get.put(OtpController(Get.find()), permanent: true);
  }
}
