import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/controllers/more/vehicle_catalouge_controller.dart';
import 'package:turno_customer_application/presentation/widgets/coming_soon.dart';

class VehicleCatalouge extends GetView<VehicleCatalougeController> {
  const VehicleCatalouge({Key? key}) : super(key: key);

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
