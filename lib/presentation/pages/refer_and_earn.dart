import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:turno_customer_application/presentation/controllers/more/refer_controller.dart';

import '../../app/config/app_colors.dart';
import '../widgets/coming_soon.dart';

class ReferAndEarn extends GetView<ReferController> {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: controller.isDataAvailable
              ? Container()
              : ComingSoon(
                  showButton: true,
                ),
        ));
  }
}
