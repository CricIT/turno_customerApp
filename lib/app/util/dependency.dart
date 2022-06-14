import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/login_repository.dart';
import 'package:turno_customer_application/data/repositories/otp_repository.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/more_controller.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => LoginRepositoryIml(),fenix: true);
    Get.lazyPut(() => OtpRepositoryIml(),fenix: true);
    Get.lazyPut(() => MoreController(),fenix: true);
  }
}
