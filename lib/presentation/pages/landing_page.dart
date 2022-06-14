import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/pages/profile.dart';
import 'package:turno_customer_application/presentation/pages/support.dart';
import 'package:turno_customer_application/presentation/widgets/appbar.dart';
import '../../app/config/constant.dart';
import '../../app/config/dimentions.dart';
import '../controllers/landing_page/landing_page_controller.dart';
import 'my_vehicle.dart';
import 'loan.dart';
import 'more.dart';



class LandingPage extends GetView<LandingPageController> {

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants.deviceHeight = MediaQuery.of(context).size.height;
    Constants.deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        // here the desired height
        child: BaseAppBar(customerName: "Ramesh",vehicleName: "Piaggio Ape Electrik",),
      ),
      bottomNavigationBar:
      buildBottomNavigationMenu(context, controller),
      body: SafeArea(
        child: Obx(() =>
            IndexedStack(
              index: controller.selectedIndex.value,
              children: const [
                MyVehicle(),
                Loan(),
                Support(),
                Profile(),
                More(),
              ],
            )),
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() =>
        MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SizedBox(
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedFontSize: Dimensions.FONT_SIZE_DEFAULT,
                unselectedFontSize: Dimensions.FONT_SIZE_SMALL,
                onTap: landingPageController.setSelectedIndex,
                currentIndex: landingPageController.selectedIndex.value,
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.darkBlue,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Poppins'),
                unselectedIconTheme: const IconThemeData(
                  color: AppColors.darkGray,
                ),
                unselectedItemColor: AppColors.darkGray,
                items:  [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home,
                      size: Dimensions.RADIUS_XXLARGE,
                    ),
                    label: 'my_vehicle'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.search,
                      size: Dimensions.RADIUS_XXLARGE,
                    ),
                    label: 'loan_details'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.support_agent,
                      size: Dimensions.RADIUS_XXLARGE,
                    ),
                    label: 'help'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.account_circle,
                      size:Dimensions.RADIUS_XXLARGE,
                    ),
                    label: 'profile'.tr,
                  ),
                   BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.more_vert,
                      size:Dimensions.RADIUS_XXLARGE,
                    ),
                    label: 'more'.tr,
                  ),
                ],
              ),
            )));
  }


}
