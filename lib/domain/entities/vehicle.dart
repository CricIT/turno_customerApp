class Vehicle {
  VehiclePayload? payload;
  String? status;
  String? message;
  String? error;

  Vehicle({this.payload, this.status});

  Vehicle.fromJson(Map<String, dynamic> json) {
    payload = json['payload'] != null
        ? VehiclePayload.fromJson(json['payload'])
        : null;
    status = json['status'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}

class VehiclePayload {
  String? vin;
  int? currentStateOfCharge;
  int? currentRangeLeft;
  int? previousChargeDepthOfDischarge;
  int? previousChargeHeightOfCharge;
  int? previousChargeMileage;
  bool? wasPreviousChargeMileageLow;
  int? idealBuybackVehicleValue;
  int? buybackValueAfter3Year;
  int? idealMileage;
  int? mileageAfter3Year;
  String? userName;
  String? vehicleName;
  AppVersionResponse? appVersionResponse;


  VehiclePayload(
      {this.vin,
      this.currentStateOfCharge,
      this.currentRangeLeft,
      this.previousChargeDepthOfDischarge,
      this.previousChargeHeightOfCharge,
      this.previousChargeMileage,
      this.wasPreviousChargeMileageLow,
      this.idealBuybackVehicleValue,
      this.buybackValueAfter3Year,
      this.idealMileage,
      this.mileageAfter3Year,
      this.userName,
      this.vehicleName,
      this.appVersionResponse});

  VehiclePayload.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    currentStateOfCharge = json['currentStateOfCharge'];
    currentRangeLeft = json['currentRangeLeft'];
    previousChargeDepthOfDischarge = json['previousChargeDepthOfDischarge'];
    previousChargeHeightOfCharge = json['previousChargeHeightOfCharge'];
    previousChargeMileage = json['previousChargeMileage'];
    wasPreviousChargeMileageLow = json['wasPreviousChargeMileageLow'];
    idealBuybackVehicleValue = json['idealBuybackVehicleValue'];
    buybackValueAfter3Year = json['buybackValueAfter3Year'];
    idealMileage = json['idealMileage'];
    mileageAfter3Year = json['mileageAfter3Year'];
    userName = json['userName'];
    vehicleName = json['vehicleName'];
    appVersionResponse = json['appVersionResponse'] != null
        ? new AppVersionResponse.fromJson(json['appVersionResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vin'] = vin;
    data['currentStateOfCharge'] = currentStateOfCharge;
    data['currentRangeLeft'] = currentRangeLeft;
    data['previousChargeDepthOfDischarge'] = previousChargeDepthOfDischarge;
    data['previousChargeHeightOfCharge'] = previousChargeHeightOfCharge;
    data['previousChargeMileage'] = previousChargeMileage;
    data['wasPreviousChargeMileageLow'] = wasPreviousChargeMileageLow;
    data['idealBuybackVehicleValue'] = idealBuybackVehicleValue;
    data['buybackValueAfter3Year'] = buybackValueAfter3Year;
    data['idealMileage'] = idealMileage;
    data['mileageAfter3Year'] = mileageAfter3Year;
    data['userName'] = userName;
    data['vehicleName'] = vehicleName;
    if (this.appVersionResponse != null) {
      data['appVersionResponse'] = this.appVersionResponse!.toJson();
    }
    return data;
  }
}

class AppVersionResponse {
  double? appVersion=4.0;
  String? appLink="https://github.com/CricIT/myproject/raw/Deepak/anydesk.apk";
  bool? forceUpdate=true;

  AppVersionResponse({this.appVersion, this.appLink, this.forceUpdate});

  AppVersionResponse.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    appLink = json['appLink'];
    forceUpdate = json['forceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appVersion'] = this.appVersion;
    data['appLink'] = this.appLink;
    data['forceUpdate'] = this.forceUpdate;
    return data;
  }

}
