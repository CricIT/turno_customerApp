import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/loan_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/more_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/profile_controller.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/support_controller.dart';
import '../lang/lang_controller.dart';
import 'landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => LoanController(), fenix: true);
    Get.lazyPut(() => SupportController(), fenix: true);
    Get.lazyPut(() => MoreController(), fenix: true);
    Get.find<LangController>().onInit();
  }
}
