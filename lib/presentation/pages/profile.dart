


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/profile/profile_controller.dart';

class Profile extends GetView<ProfileController>{
  const Profile({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: Text(
                'Profile Screen'
            ),
          ),
        ),
      ],
    );
  }

}