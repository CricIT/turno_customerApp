import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/loan_repository.dart';
import 'package:turno_customer_application/data/repositories/vehicle_repository.dart';
import 'package:turno_customer_application/domain/usecases/loan/loan_usecase.dart';
import 'package:turno_customer_application/domain/usecases/vehicle/vehicle_usecase.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/loan_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/more_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/profile_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/support_controller.dart';
import '../lang/lang_controller.dart';
import 'landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingPageController(Get.find()), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => VehicleUseCase(Get.find<VehicleRepositoryIml>()),
        fenix: true);
    Get.lazyPut(() => LoanUseCase(Get.find<LoanRepositoryIml>()), fenix: true);
    Get.lazyPut(() => LoanController(Get.find()), fenix: true);
    Get.lazyPut(() => SupportController(), fenix: true);
    Get.lazyPut(() => MoreController(), fenix: true);
    Get.find<LangController>().onInit();
  }
}
