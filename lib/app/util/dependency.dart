import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/login_repository.dart';
import 'package:turno_customer_application/data/repositories/otp_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => LoginRepositoryIml());
    Get.lazyPut(() => OtpRepositoryIml());
  }
}
