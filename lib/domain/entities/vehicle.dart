class Vehicle {
  Payload? payload;
  String? status;
  String? message;
  String? error;

  Vehicle({this.payload, this.status});

  Vehicle.fromJson(Map<String, dynamic> json) {
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    status = json['status'];
    message= json['message'];
    error= json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['status'] = this.status;
    data['message']=this.message;
    data['error']=this.error;
    return data;
  }
}

class Payload {
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

  Payload(
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
        this.vehicleName});

  Payload.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['currentStateOfCharge'] = this.currentStateOfCharge;
    data['currentRangeLeft'] = this.currentRangeLeft;
    data['previousChargeDepthOfDischarge'] =
        this.previousChargeDepthOfDischarge;
    data['previousChargeHeightOfCharge'] = this.previousChargeHeightOfCharge;
    data['previousChargeMileage'] = this.previousChargeMileage;
    data['wasPreviousChargeMileageLow'] = this.wasPreviousChargeMileageLow;
    data['idealBuybackVehicleValue'] = this.idealBuybackVehicleValue;
    data['buybackValueAfter3Year'] = this.buybackValueAfter3Year;
    data['idealMileage'] = this.idealMileage;
    data['mileageAfter3Year'] = this.mileageAfter3Year;
    data['userName'] = this.userName;
    data['vehicleName'] = this.vehicleName;
    return data;
  }
}