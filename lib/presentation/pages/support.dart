


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:turno_customer_application/presentation/controllers/support/support.dart';


class Support extends GetView<SupportController>{
  const Support({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: Text(
                'Support Screen'
            ),
          ),
        ),
      ],
    );
  }

}