import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../loan/loan_controller.dart';

class PaymentHistoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final loanController = Get.find<LoanController>();
}
