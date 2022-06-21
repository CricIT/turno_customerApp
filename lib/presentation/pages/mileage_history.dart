import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import 'package:turno_customer_application/presentation/controllers/mileage_history/mileage_history_controller.dart';
import 'package:turno_customer_application/presentation/widgets/generic_appbar.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/constant.dart';
import '../widgets/custom_text_button.dart';

class MileageHistory extends GetView<MileageHistoryController> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 0),
    _SalesData('Mar', 34),
    _SalesData('Apr', 0),
    _SalesData('May', 40),
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: GenericAppBar(heading: "mileage_history".tr)),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            color: AppColors.whiteColor,
            height: Constants.deviceHeight,
            width: Constants.deviceWidth,
            child: Column(
              children: [
                /* SfSparkBarChart.custom(

              xValueMapper: (int index) => data[index].year,
              yValueMapper: (int index) => data[index].sales,
              dataCount: 10,
            ),*/
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    //Initialize the spark charts widget
                    child: SfSparkLineChart.custom(
                      //Enable the trackball
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      //Enable marker
                      marker: SparkChartMarker(
                          displayMode: SparkChartMarkerDisplayMode.all),
                      //Enable data label
                      labelDisplayMode: SparkChartLabelDisplayMode.all,
                      xValueMapper: (int index) => data[index].year,
                      yValueMapper: (int index) => data[index].sales,
                      dataCount: 5,
                    ),
                  ),
                ),
                const Spacer(),
                Text('note_best_practices'.tr),
                CustomTextButton(
                  title: 'best_charging_practices'.tr,
                  textAlign: TextAlign.center,
                  onTap: () {},
                  showTrailingIcon: true,
                  color: AppColors.darkBlue,
                  borderColor: AppColors.borderGray,
                  isBorderVisibile: false,
                ),
              ],
            ),
          ),
        )));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
