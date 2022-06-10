import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/routes/app_route.dart';
import 'package:turno_customer_application/presentation/controllers/lang/lang_controller.dart';

class ChooseLanguage extends GetView<LangController> {
  ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'choose_language'.tr,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: Constants.languages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColorLight,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Center(
                              child: Text(
                            Constants.languages[index],
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                          onTap: () {
                            Get.updateLocale(Constants.locale[index]['locale']);
                            controller.setUserPreferredLanguage(
                                Constants.locale[index]['name']);
                            Get.toNamed(AppRoutes.LOGIN);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
