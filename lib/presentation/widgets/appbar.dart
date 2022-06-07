// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const BaseAppBar({required this.appBar});
  final Color backgroundColor = AppColors.primaryColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Turno',
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
