import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/support_repository.dart';
import 'package:turno_customer_application/presentation/controllers/support/support_controller.dart';

import '../../../domain/usecases/support/support_usecase.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportUseCase(Get.find<SupportRepositoryIml>()));
    Get.lazyPut(() => SupportController(Get.find()));
  }
}
