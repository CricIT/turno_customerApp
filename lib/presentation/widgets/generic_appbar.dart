// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';

import '../../app/constants/images.dart';

class GenericAppBar extends StatelessWidget {
  String heading;

  GenericAppBar({required this.heading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.whiteColor,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: SvgPicture.asset(Images.icon_bck_btn,color: AppColors.whiteColor,),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(heading, style: whiteNormal16),
        ],
      ),
      backgroundColor: AppColors.lightPurple,
    );
  }
}
