import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../app/config/app_colors.dart';
import '../../app/constants/images.dart';
import '../controllers/home/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_label.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/guage_card.dart';


class MyVehicle extends GetView<HomeController> {
  const MyVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _vehicleSocAndCurrentBuyBackValue(),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomLabel(
                    title: "3_years_return_value".tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomLabel(
                    title: "3_years_calculation_desc".tr,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGray,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _threeYearBuyBackValueCard(),
                  const SizedBox(
                    height: 10,
                  ),

                ]),
          ),
        )));
  }

  _vehicleSocAndCurrentBuyBackValue() {
    return Container(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 30,right: 30),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.borderGray,
              width: 1,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Images.batteryChagre),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomLabel(
                        title: "charge".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomLabel(
                      title: "58%",
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black)
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Images.bolt),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomLabel(
                          title: "available_range".tr,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGray)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomLabel(
                      title: "97 KM",
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black)
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: const Divider(
              height: 2,
              color: AppColors.dividerGray,
            ),
          ),
          CustomRichText(
            spanText1: "${"buy_back_value".tr}: ",
            spanText2: " ₹ 1,30,000",
            color1: AppColors.darkGray,
            color2: AppColors.black,
            fontSize1: 18,
            fontSize2: 18,
          )
        ]));
  }

  _threeYearBuyBackValueCard() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GuageCardView(
            header:"Buyback value",
            startRange:"0",
            endRange:"1,50,000",
            description:"The value that you get on selling the vehicle back to Turno after 3 years",
            centreValue:"₹ 1,30,000",
            centreText:"Current value",
            isSingleColour: false,
          ),

          GuageCardView(
            header:"Buyback value",
            startRange:"0",
            endRange:"120",
            description:"The value that you get on selling the vehicle back to Turno after 3 years",
            centreValue:"109",
            centreText:"km/charge",
            isSingleColour: true,
          )

        ],

    );
  }
}


