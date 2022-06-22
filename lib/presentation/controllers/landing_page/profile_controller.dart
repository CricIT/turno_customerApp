import 'package:get/get.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/ProfileScreen');
  }
}
