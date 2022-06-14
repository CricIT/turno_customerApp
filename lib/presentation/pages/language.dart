import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/presentation/controllers/lang/lang_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

import '../../app/services/local_storage.dart';

class ChooseLanguage extends GetView<LangController> {
  ChooseLanguage({Key? key}) : super(key: key);

  final store = Get.find<LocalStorageService>();

  @override
  Widget build(BuildContext context) {
    Constants.deviceHeight = MediaQuery.of(context).size.height;
    Constants.deviceWidth = MediaQuery.of(context).size.width;
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
                  // child: Text(
                  //   'choose_language'.tr,
                  //   style: const TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  child: CustomLabel(
                    title: 'choose_language'.tr,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.FONT_SIZE_XXXLARGE,
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
                              child: CustomLabel(
                            title: Constants.languages[index],
                            color: AppColors.whiteColor,
                            fontSize: Dimensions.FONT_SIZE_XXLARGE,
                            fontWeight: FontWeight.w700,
                          )),
                          onTap: () {
                            Get.updateLocale(Constants.locale[index]['locale']);
                            controller.setUserPreferredLanguage(
                                Constants.locale[index]['name']);

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
