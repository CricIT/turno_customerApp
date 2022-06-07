// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final _phoneController = TextEditingController();
  LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'We will send you an ',
                            style: TextStyle(
                                color: AppColors.blackColor, fontSize: 17)),
                        TextSpan(
                            text: 'One Time Password ',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        TextSpan(
                            text: 'on this mobile number',
                            style: TextStyle(
                                color: AppColors.blackColor, fontSize: 17)),
                      ]),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      prefixText: '+91',
                      labelText: "Enter your number",
                      labelStyle: TextStyle(color: AppColors.placeholderColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: AppColors.subTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: RaisedButton(
                    onPressed: () {
                      controller.signUpWith(_phoneController.text);
                      Get.toNamed(AppRoutes.OTP);
                    },
                    color: AppColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: AppColors.primaryColorLight,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> imageSliders = Constants.loginPageImages
      .map(
        (item) => Card(
          elevation: 4,
          shadowColor: Colors.grey.shade50,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
              ],
            ),
          ),
        ),
      )
      .toList();
}
