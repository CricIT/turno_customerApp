import 'package:get/get.dart';

import '../../../app/core/tracker/tracker.dart';

class BestChargingPracticeController extends GetxController {
  BestChargingPracticeController(this._controler);
  final BestChargingPracticeController _controler;

  @override
  void onInit() {
    super.onInit();
    print('best practices screen');
    TrackHandler.trackScreen(screenName: 'best_practices_screen');
  }
}
