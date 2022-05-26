




import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/home/home_controller.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(HomeController());
  }


}