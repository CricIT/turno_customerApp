




import 'package:get/get.dart';

import 'mileage_history_controller.dart';

class MileageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MileageHistoryController(), fenix: true);
  }

}