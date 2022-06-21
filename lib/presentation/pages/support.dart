import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/support_controller.dart';
import 'package:turno_customer_application/presentation/widgets/coming_soon.dart';

class Support extends GetView<SupportController> {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComingSoon(
      showButton: false,
    );
  }
}
