import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonAction,
    required this.child,
    this.width,
    this.isActive = true,
    this.height = 44.0,
    this.fontSize = 18,
    this.bgColor,
    this.paddingWidth = 10.0,
    this.languageCode = false,
  }) : super(key: key);

  final Widget? child;
  final Function() buttonAction;
  final double fontSize;
  final bool isActive;
  final double? width;
  final double height;
  final bool isOutlined = false;
  final bool isRounded = true;
  final Color? bgColor;
  final double paddingWidth;
  final bool languageCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          onSurface: AppColors.lightGray,
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              paddingWidth,
            ),
          ),
        ),
        onPressed: buttonAction,
        child: child,
      ),
    );
  }
}
