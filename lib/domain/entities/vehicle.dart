class Vehicle {
  Payload? payload;
  String? status;

  Vehicle({this.payload, this.status});

  Vehicle.fromJson(Map<String, dynamic> json) {
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Payload {
  String? vin;
  int? currentStateOfCharge;
  int? currentRangeLeft;
  AppVersionResponse? appVersionResponse;
  ChargeStatisticsResponse? chargeStatisticsResponse;
  MileageStatisticsComparisonResponse? mileageStatisticsComparisonResponse;
  CustomerDetails? customerDetails;
  After3YearStatistics? after3YearStatistics;

  Payload(
      {this.vin,
        this.currentStateOfCharge,
        this.currentRangeLeft,
        this.appVersionResponse,
        this.chargeStatisticsResponse,
        this.mileageStatisticsComparisonResponse,
        this.customerDetails,
        this.after3YearStatistics});

  Payload.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    currentStateOfCharge = json['currentStateOfCharge'];
    currentRangeLeft = json['currentRangeLeft'];
    appVersionResponse = json['appVersionResponse'] != null
        ? new AppVersionResponse.fromJson(json['appVersionResponse'])
        : null;
    chargeStatisticsResponse = json['chargeStatisticsResponse'] != null
        ? new ChargeStatisticsResponse.fromJson(
        json['chargeStatisticsResponse'])
        : null;
    mileageStatisticsComparisonResponse =
    json['mileageStatisticsComparisonResponse'] != null
        ? new MileageStatisticsComparisonResponse.fromJson(
        json['mileageStatisticsComparisonResponse'])
        : null;
    customerDetails = json['customerDetails'] != null
        ? new CustomerDetails.fromJson(json['customerDetails'])
        : null;
    after3YearStatistics = json['after3YearStatistics'] != null
        ? new After3YearStatistics.fromJson(json['after3YearStatistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['currentStateOfCharge'] = this.currentStateOfCharge;
    data['currentRangeLeft'] = this.currentRangeLeft;
    if (this.appVersionResponse != null) {
      data['appVersionResponse'] = this.appVersionResponse!.toJson();
    }
    if (this.chargeStatisticsResponse != null) {
      data['chargeStatisticsResponse'] =
          this.chargeStatisticsResponse!.toJson();
    }
    if (this.mileageStatisticsComparisonResponse != null) {
      data['mileageStatisticsComparisonResponse'] =
          this.mileageStatisticsComparisonResponse!.toJson();
    }
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails!.toJson();
    }
    if (this.after3YearStatistics != null) {
      data['after3YearStatistics'] = this.after3YearStatistics!.toJson();
    }
    return data;
  }
}

class AppVersionResponse {
  double? appVersion;
  String? appLink;
  bool? forceUpdate;

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

class ChargeStatisticsResponse {
  int? previousChargeDepthOfDischarge;
  int? previousChargeHeightOfCharge;
  int? depthOfDischargeStatus;
  int? heightOfChargeStatus;

  ChargeStatisticsResponse(
      {this.previousChargeDepthOfDischarge,
        this.previousChargeHeightOfCharge,
        this.depthOfDischargeStatus,
        this.heightOfChargeStatus});

  ChargeStatisticsResponse.fromJson(Map<String, dynamic> json) {
    previousChargeDepthOfDischarge = json['previousChargeDepthOfDischarge'];
    previousChargeHeightOfCharge = json['previousChargeHeightOfCharge'];
    depthOfDischargeStatus = json['depthOfDischargeStatus'];
    heightOfChargeStatus = json['heightOfChargeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previousChargeDepthOfDischarge'] =
        this.previousChargeDepthOfDischarge;
    data['previousChargeHeightOfCharge'] = this.previousChargeHeightOfCharge;
    data['depthOfDischargeStatus'] = this.depthOfDischargeStatus;
    data['heightOfChargeStatus'] = this.heightOfChargeStatus;
    return data;
  }
}

class MileageStatisticsComparisonResponse {
  int? previousChargeMileage;
  bool? wasPreviousChargeMileageLow;
  int? previousChargeMileageStatus;
  int? comparisonPercentOfUsers;
  int? comparisonUsersChargeMileage;

  MileageStatisticsComparisonResponse(
      {this.previousChargeMileage,
        this.wasPreviousChargeMileageLow,
        this.previousChargeMileageStatus,
        this.comparisonPercentOfUsers,
        this.comparisonUsersChargeMileage});

  MileageStatisticsComparisonResponse.fromJson(Map<String, dynamic> json) {
    previousChargeMileage = json['previousChargeMileage'];
    wasPreviousChargeMileageLow = json['wasPreviousChargeMileageLow'];
    previousChargeMileageStatus = json['previousChargeMileageStatus'];
    comparisonPercentOfUsers = json['comparisonPercentOfUsers'];
    comparisonUsersChargeMileage = json['comparisonUsersChargeMileage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previousChargeMileage'] = this.previousChargeMileage;
    data['wasPreviousChargeMileageLow'] = this.wasPreviousChargeMileageLow;
    data['previousChargeMileageStatus'] = this.previousChargeMileageStatus;
    data['comparisonPercentOfUsers'] = this.comparisonPercentOfUsers;
    data['comparisonUsersChargeMileage'] = this.comparisonUsersChargeMileage;
    return data;
  }
}

class CustomerDetails {
  String? userName;
  String? vehicleName;

  CustomerDetails({this.userName, this.vehicleName});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    vehicleName = json['vehicleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['vehicleName'] = this.vehicleName;
    return data;
  }
}

class After3YearStatistics {
  int? idealBuybackVehicleValue;
  int? buybackValueAfter3Year;
  int? idealMileage;
  int? mileageAfter3Year;

  After3YearStatistics(
      {this.idealBuybackVehicleValue,
        this.buybackValueAfter3Year,
        this.idealMileage,
        this.mileageAfter3Year});

  After3YearStatistics.fromJson(Map<String, dynamic> json) {
    idealBuybackVehicleValue = json['idealBuybackVehicleValue'];
    buybackValueAfter3Year = json['buybackValueAfter3Year'];
    idealMileage = json['idealMileage'];
    mileageAfter3Year = json['mileageAfter3Year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idealBuybackVehicleValue'] = this.idealBuybackVehicleValue;
    data['buybackValueAfter3Year'] = this.buybackValueAfter3Year;
    data['idealMileage'] = this.idealMileage;
    data['mileageAfter3Year'] = this.mileageAfter3Year;
    return data;
  }
}