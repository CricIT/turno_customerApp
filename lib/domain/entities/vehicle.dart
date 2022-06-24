// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  Vehicle({
    this.payload,
    this.status,
  });

  Payload? payload;
  String? status;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        payload: json["payload"] == null
            ? Payload(
                vin: "",
                currentStateOfCharge: 0,
                currentRangeLeft: 0,
                appVersionResponse: AppVersionResponse(
                    appVersion: 0.0, appLink: "", forceUpdate: false),
                chargeStatisticsResponse: ChargeStatisticsResponse(
                  previousChargeDepthOfDischarge: 0,
                  previousChargeHeightOfCharge: 0,
                  depthOfDischargeStatus: 0,
                  heightOfChargeStatus: 0,
                ),
                mileageStatisticsComparisonResponse:  MileageStatisticsComparisonResponse(
                    previousChargeMileage: 0,
                    wasPreviousChargeMileageLow: false,
                    previousChargeMileageStatus: 0,
                    comparisonPercentOfUsers: 0,
                    comparisonUsersChargeMileage: 0),
                customerDetails: CustomerDetails(userName: "", vehicleName: ""),
                after3YearStatistics: After3YearStatistics(
                  idealBuybackVehicleValue: 0,
                  buybackValueAfter3Year: 0,
                  idealMileage: 0,
                  mileageAfter3Year: 0,
                ))
            : Payload.fromJson(json["payload"]),
        status: json["status"] == null ? "" : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload == null ? null : payload?.toJson(),
        "status": status == null ? null : status,
      };
}

class Payload {
  Payload({
    this.vin,
    this.currentStateOfCharge,
    this.currentRangeLeft,
    this.appVersionResponse,
    this.chargeStatisticsResponse,
    this.mileageStatisticsComparisonResponse,
    this.customerDetails,
    this.after3YearStatistics,
  });

  String? vin;
  int? currentStateOfCharge;
  int? currentRangeLeft;
  AppVersionResponse? appVersionResponse;
  ChargeStatisticsResponse? chargeStatisticsResponse;
  MileageStatisticsComparisonResponse? mileageStatisticsComparisonResponse;
  CustomerDetails? customerDetails;
  After3YearStatistics? after3YearStatistics;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        vin: json["vin"] == null ? "" : json["vin"],
        currentStateOfCharge: json["currentStateOfCharge"] == 0
            ? null
            : json["currentStateOfCharge"],
        currentRangeLeft:
            json["currentRangeLeft"] == null ? 0 : json["currentRangeLeft"],
        appVersionResponse: json["appVersionResponse"] == null
            ? AppVersionResponse(
                appVersion: 0.0, appLink: "", forceUpdate: false)
            : AppVersionResponse.fromJson(json["appVersionResponse"]),
        chargeStatisticsResponse: json["chargeStatisticsResponse"] == null
            ? ChargeStatisticsResponse(
                previousChargeDepthOfDischarge: 0,
                previousChargeHeightOfCharge: 0,
                depthOfDischargeStatus: 0,
                heightOfChargeStatus: 0,
              )
            : ChargeStatisticsResponse.fromJson(
                json["chargeStatisticsResponse"]),
        mileageStatisticsComparisonResponse:
            json["mileageStatisticsComparisonResponse"] == null
                ? MileageStatisticsComparisonResponse(
                    previousChargeMileage: 0,
                    wasPreviousChargeMileageLow: false,
                    previousChargeMileageStatus: 0,
                    comparisonPercentOfUsers: 0,
                    comparisonUsersChargeMileage: 0)
                : MileageStatisticsComparisonResponse.fromJson(
                    json["mileageStatisticsComparisonResponse"]),
        customerDetails: json["customerDetails"] == null
            ? CustomerDetails(userName: "", vehicleName: "")
            : CustomerDetails.fromJson(json["customerDetails"]),
        after3YearStatistics: json["after3YearStatistics"] == null
            ? After3YearStatistics(
                idealBuybackVehicleValue: 0,
                buybackValueAfter3Year: 0,
                idealMileage: 0,
                mileageAfter3Year: 0,
              )
            : After3YearStatistics.fromJson(json["after3YearStatistics"]),
      );

  Map<String, dynamic> toJson() => {
        "vin": vin == null ? null : vin,
        "currentStateOfCharge":
            currentStateOfCharge == null ? null : currentStateOfCharge,
        "currentRangeLeft": currentRangeLeft == null ? null : currentRangeLeft,
        "appVersionResponse":
            appVersionResponse == null ? null : appVersionResponse?.toJson(),
        "chargeStatisticsResponse": chargeStatisticsResponse == null
            ? null
            : chargeStatisticsResponse?.toJson(),
        "mileageStatisticsComparisonResponse":
            mileageStatisticsComparisonResponse == null
                ? null
                : mileageStatisticsComparisonResponse?.toJson(),
        "customerDetails":
            customerDetails == null ? null : customerDetails?.toJson(),
        "after3YearStatistics": after3YearStatistics == null
            ? null
            : after3YearStatistics?.toJson(),
      };
}

class After3YearStatistics {
  After3YearStatistics({
    this.idealBuybackVehicleValue,
    this.buybackValueAfter3Year,
    this.idealMileage,
    this.mileageAfter3Year,
  });

  int? idealBuybackVehicleValue;
  int? buybackValueAfter3Year;
  int? idealMileage;
  int? mileageAfter3Year;

  factory After3YearStatistics.fromJson(Map<String, dynamic> json) =>
      After3YearStatistics(
        idealBuybackVehicleValue: json["idealBuybackVehicleValue"] == null
            ? 0
            : json["idealBuybackVehicleValue"],
        buybackValueAfter3Year: json["buybackValueAfter3Year"] == null
            ? 0
            : json["buybackValueAfter3Year"],
        idealMileage: json["idealMileage"] == null ? 0 : json["idealMileage"],
        mileageAfter3Year:
            json["mileageAfter3Year"] == null ? 0 : json["mileageAfter3Year"],
      );

  Map<String, dynamic> toJson() => {
        "idealBuybackVehicleValue":
            idealBuybackVehicleValue == null ? null : idealBuybackVehicleValue,
        "buybackValueAfter3Year":
            buybackValueAfter3Year == null ? null : buybackValueAfter3Year,
        "idealMileage": idealMileage == null ? null : idealMileage,
        "mileageAfter3Year":
            mileageAfter3Year == null ? null : mileageAfter3Year,
      };
}

class AppVersionResponse {
  AppVersionResponse({
    this.appVersion,
    this.appLink,
    this.forceUpdate,
  });

  double? appVersion;
  String? appLink;
  bool? forceUpdate;

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      AppVersionResponse(
        appVersion: json["appVersion"] == null ? 0.0 : json["appVersion"],
        appLink: json["appLink"] == null ? "" : json["appLink"],
        forceUpdate: json["forceUpdate"] == null ? false : json["forceUpdate"],
      );

  Map<String, dynamic> toJson() => {
        "appVersion": appVersion == null ? null : appVersion,
        "appLink": appLink == null ? null : appLink,
        "forceUpdate": forceUpdate == null ? null : forceUpdate,
      };
}

class ChargeStatisticsResponse {
  ChargeStatisticsResponse({
    this.previousChargeDepthOfDischarge,
    this.previousChargeHeightOfCharge,
    this.depthOfDischargeStatus,
    this.heightOfChargeStatus,
  });

  int? previousChargeDepthOfDischarge;
  int? previousChargeHeightOfCharge;
  int? depthOfDischargeStatus;
  int? heightOfChargeStatus;

  factory ChargeStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      ChargeStatisticsResponse(
        previousChargeDepthOfDischarge:
            json["previousChargeDepthOfDischarge"] == null
                ? 0
                : json["previousChargeDepthOfDischarge"],
        previousChargeHeightOfCharge:
            json["previousChargeHeightOfCharge"] == null
                ? 0
                : json["previousChargeHeightOfCharge"],
        depthOfDischargeStatus: json["depthOfDischargeStatus"] == null
            ? 0
            : json["depthOfDischargeStatus"],
        heightOfChargeStatus: json["heightOfChargeStatus"] == null
            ? 0
            : json["heightOfChargeStatus"],
      );

  Map<String, dynamic> toJson() => {
        "previousChargeDepthOfDischarge": previousChargeDepthOfDischarge == null
            ? null
            : previousChargeDepthOfDischarge,
        "previousChargeHeightOfCharge": previousChargeHeightOfCharge == null
            ? null
            : previousChargeHeightOfCharge,
        "depthOfDischargeStatus":
            depthOfDischargeStatus == null ? null : depthOfDischargeStatus,
        "heightOfChargeStatus":
            heightOfChargeStatus == null ? null : heightOfChargeStatus,
      };
}

class CustomerDetails {
  CustomerDetails({
    this.userName,
    this.vehicleName,
  });

  String? userName;
  String? vehicleName;

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        userName: json["userName"] == null ? "" : json["userName"],
        vehicleName: json["vehicleName"] == null ? "" : json["vehicleName"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName == null ? null : userName,
        "vehicleName": vehicleName == null ? null : vehicleName,
      };
}

class MileageStatisticsComparisonResponse {
  MileageStatisticsComparisonResponse({
    this.previousChargeMileage,
    this.wasPreviousChargeMileageLow,
    this.previousChargeMileageStatus,
    this.comparisonPercentOfUsers,
    this.comparisonUsersChargeMileage,
  });

  int? previousChargeMileage;
  bool? wasPreviousChargeMileageLow;
  int? previousChargeMileageStatus;
  int? comparisonPercentOfUsers;
  int? comparisonUsersChargeMileage;

  factory MileageStatisticsComparisonResponse.fromJson(
          Map<String, dynamic> json) =>
      MileageStatisticsComparisonResponse(
        previousChargeMileage: json["previousChargeMileage"] == null
            ? 0
            : json["previousChargeMileage"],
        wasPreviousChargeMileageLow: json["wasPreviousChargeMileageLow"] == null
            ? false
            : json["wasPreviousChargeMileageLow"],
        previousChargeMileageStatus: json["previousChargeMileageStatus"] == null
            ? 0
            : json["previousChargeMileageStatus"],
        comparisonPercentOfUsers: json["comparisonPercentOfUsers"] == null
            ? 0
            : json["comparisonPercentOfUsers"],
        comparisonUsersChargeMileage:
            json["comparisonUsersChargeMileage"] == null
                ? 0
                : json["comparisonUsersChargeMileage"],
      );

  Map<String, dynamic> toJson() => {
        "previousChargeMileage":
            previousChargeMileage == null ? null : previousChargeMileage,
        "wasPreviousChargeMileageLow": wasPreviousChargeMileageLow == null
            ? null
            : wasPreviousChargeMileageLow,
        "previousChargeMileageStatus": previousChargeMileageStatus == null
            ? null
            : previousChargeMileageStatus,
        "comparisonPercentOfUsers":
            comparisonPercentOfUsers == null ? null : comparisonPercentOfUsers,
        "comparisonUsersChargeMileage": comparisonUsersChargeMileage == null
            ? null
            : comparisonUsersChargeMileage,
      };
}
