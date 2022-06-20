



import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../../data/repositories/loan_repository.dart';
import '../../../domain/usecases/loan/loan_usecase.dart';
import 'loan_controller.dart';

class LoanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanUseCase(Get.find<LoanRepositoryIml>()));
    Get.put(LoanController(Get.find()));

  }
}
