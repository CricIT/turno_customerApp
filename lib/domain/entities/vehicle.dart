class Vehicle {
  String? vin;
  int? currentStateOfCharge;
  int? currentRangeLeft;
  int? previousChargeDepthOfDischarge;
  int? previousChargeHeightOfCharge;
  int previousChargeMileage;
  bool wasPreviousChargeMileageLow;
  int? idealBuybackVehicleValue;
  int? buybackValueAfter3Year;
  int? idealMileage;
  int? mileageAfter3Year;
  String? userName;
  String? vehicleName;

  Vehicle({
    this.vin,
    this.buybackValueAfter3Year,
    this.currentRangeLeft,
    this.currentStateOfCharge,
    this.idealBuybackVehicleValue,
    this.idealMileage,
    this.mileageAfter3Year,
    this.previousChargeDepthOfDischarge,
    this.previousChargeHeightOfCharge,
    required this.previousChargeMileage,
    required this.wasPreviousChargeMileageLow,
    this.userName,
    this.vehicleName
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
        vin: json['vin'],
        currentStateOfCharge: json['currentStateOfCharge'],
        currentRangeLeft: json['currentRangeLeft'],
        previousChargeDepthOfDischarge: json['previousChargeDepthOfDischarge'],
        previousChargeHeightOfCharge: json['previousChargeHeightOfCharge'],
        previousChargeMileage: json['previousChargeMileage'],
        wasPreviousChargeMileageLow: json['wasPreviousChargeMileageLow'],
        idealBuybackVehicleValue: json['idealBuybackVehicleValue'],
        buybackValueAfter3Year: json['buybackValueAfter3Year'],
        idealMileage: json['idealMileage'],
        mileageAfter3Year: json['mileageAfter3Year'],
        userName:json['userName'],
        vehicleName:json['vehicleName']);

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
    data['userName']=userName;
    data['vehicleName']=vehicleName;
    return data;
  }
}
