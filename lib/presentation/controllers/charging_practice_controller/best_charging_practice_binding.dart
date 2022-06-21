




import 'package:get/get.dart';

import 'best_charging_practice_controller.dart';

class BestChargingPracticeBinding extends Bindings{


  @override
  void dependencies() {
    Get.lazyPut(()=> BestChargingPracticeController(Get.find()));
  }

}