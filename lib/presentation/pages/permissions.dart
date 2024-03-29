import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/app_text_styles.dart';
import 'package:turno_customer_application/presentation/widgets/custom_button.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

import '../controllers/permissions/permission_controller.dart';

class Permissions extends GetView<PermissionsController> {
  const Permissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/permissions.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomLabel(
                    title: 'Get Ready to explore TURNO',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Start with the following permissions',
                      style: lightBlackNormal12,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Platform.isAndroid ?_buildPermissionDesc(const Icon(Icons.sms), 'SMS',
                      'Your SMSes are analyzed to have clear visibility on repayment ability and also to take underwriting decisions for further loans. Your SMSes are never uploaded.'):Container(),
                  const Divider(
                    thickness: 1.5,
                  ),
                  _buildPermissionDesc(
                      const Icon(Icons.location_on),
                      'Location',
                      'To prevent any fraudulent activities and provide location specific offers.'),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Platform.isAndroid ? _buildPermissionDesc(const Icon(Icons.storage), 'Storage',
                      'We need storage permissions to push app updates on your mobile.'):Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width,
                      buttonAction: () {
                        controller.getPermission();
                      },
                      child: const CustomLabel(
                        title: 'Allow Permissions',
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildPermissionDesc(Icon icon, String title, String description) {
    return ListTile(
      minVerticalPadding: 0,
      leading: icon,
      horizontalTitleGap: 10,
      title: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: lightBlackBold16,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          description,
          style: blackNormal14,
        ),
      ),
    );
  }
}
