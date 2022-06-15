import 'package:get/instance_manager.dart';
import 'package:turno_customer_application/presentation/controllers/payment/payment_history_controller.dart';

class PaymentHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentHistoryController());
  }
}
