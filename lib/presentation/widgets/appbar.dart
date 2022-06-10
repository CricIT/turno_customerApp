// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';


class BaseAppBar extends StatelessWidget {

  String customerName,vehicleName;

  BaseAppBar({required this.customerName, required this.vehicleName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children:  [
          const SizedBox(
            height: 24,
          ),
          Text(
            "welcome ".tr + customerName,
            style: blackNormal14
          ),
          const SizedBox(
            height: 10,

          ),
          Text(
              vehicleName,
            style: lightBlackNormal12
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      backgroundColor: AppColors.mediumGray,

    );
  }
}
