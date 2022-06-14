import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:turno_customer_application/app/config/constant.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_text_styles.dart';
import '../../app/config/dimentions.dart';
import 'custom_label.dart';

class GuageCardView extends StatelessWidget {
  String header, startRange, endRange, description, centreValue, centreText;
  bool isSingleColour;

  GuageCardView(
      {Key? key,
      required this.header,
      required this.startRange,
      required this.centreText,
      required this.centreValue,
      required this.description,
      required this.endRange,
      required this.isSingleColour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.22,
      padding: const EdgeInsets.only(
          top: Dimensions.PADDING_SIZE_LARGE,
          bottom: Dimensions.PADDING_SIZE_LARGE),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderGray,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomLabel(
              title: header,
              fontSize: Dimensions.FONT_SIZE_LARGE,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Container(
              padding: const EdgeInsets.all(0),
              height: constraints.maxWidth, // WORKAROUND
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      canScaleToFit: true,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 180,
                      endAngle: 360,
                      radiusFactor: 0.9,
                      axisLineStyle: const AxisLineStyle(
                          thickness: 0.1, thicknessUnit: GaugeSizeUnit.factor),
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            verticalAlignment: GaugeAlignment.far,
                            angle: 90,
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(centreValue, style: lightBlackBold16),
                                Text(centreText, style: darkGrayNormal10)
                              ],
                            )),
                        GaugeAnnotation(
                          angle: 180,
                          positionFactor: 1,
                          widget: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child:
                                  Text(startRange, style: lightBlackNormal12)),
                        ),
                        GaugeAnnotation(
                          angle: 360,
                          positionFactor: isSingleColour ? 1 : 0.8,
                          widget: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Text(endRange,
                                  textAlign: TextAlign.left,
                                  style: lightBlackNormal12)),
                        ),
                      ],
                      pointers: <GaugePointer>[
                        isSingleColour
                            ? const RangePointer(
                                value: 65,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 1200,
                                sizeUnit: GaugeSizeUnit.factor,
                                gradient: SweepGradient(colors: <Color>[
                                  Color(0xFF6462D9)
                                ], stops: <double>[
                                  1,
                                ]),
                                color: Color(0xFF00A8B5),
                                width: 0.1)
                            : const RangePointer(
                                value: 65,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 1200,
                                sizeUnit: GaugeSizeUnit.factor,
                                gradient: SweepGradient(colors: <Color>[
                                  Color(0xFFE84E4E),
                                  Color(0xFFF3C03B),
                                  Color(0xFF43EA7C),
                                  Color(0xFF43EA7C),
                                ], stops: <double>[
                                  0.25,
                                  0.5,
                                  0.75,
                                  1
                                ]),
                                color: Color(0xFF00A8B5),
                                width: 0.1),
                        WidgetPointer(
                            value: 65,
                            child: Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: const Icon(Icons.arrow_drop_down,
                                    color: AppColors.primaryColor)))
                      ]),
                ],
              ),
            ),
          ),
          CustomLabel(
              title: description,
              textAlign: TextAlign.center,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              maxLines: 5,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
          SizedBox(
            height: Constants.deviceHeight * 0.02 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Dimensions.RADIUS_DEFAULT,
                backgroundColor: AppColors.xlightPurple,
                child: Icon(
                  Icons.question_mark,
                  size: Constants.deviceHeight * 0.02,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: Constants.deviceWidth * 0.02,
              ),
              CustomLabel(
                  title: "how_is_it_calculated".tr,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  maxLines: 2,
                  fontWeight: FontWeight.w400),
            ],
          ),
        ],
      ),
    );
  }
}
