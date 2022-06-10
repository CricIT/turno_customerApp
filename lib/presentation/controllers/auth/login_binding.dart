import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/login_repository.dart';
import 'package:turno_customer_application/domain/usecases/auth/login_usecase.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginUseCase(Get.find<LoginRepositoryIml>()));
    Get.put(LoginController(Get.find()), permanent: true);
  }
}
