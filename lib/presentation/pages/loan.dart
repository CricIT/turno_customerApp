import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/presentation/controllers/landing_page/loan_controller.dart';

class Loan extends GetView<LoanController> {
  const Loan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: Text(
              'loan',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
