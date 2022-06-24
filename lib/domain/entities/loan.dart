// To parse this JSON data, do
//
//     final loan = loanFromJson(jsonString);

import 'dart:convert';

Loan loanFromJson(String str) => Loan.fromJson(json.decode(str));

String loanToJson(Loan data) => json.encode(data.toJson());

class Loan {
  Loan({
    this.payload,
    this.status,
  });

  Payload? payload;
  String? status;

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
    payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "payload": payload == null ? null : payload?.toJson(),
    "status": status == null ? null : status,
  };
}

class Payload {
  Payload({
    this.loanAmount,
    this.outstandingAmount,
    this.emiAmount,
    this.loanStartDateInMs,
    this.loanEndDateInMs,
    this.loanTenureInYears,
    this.upcomingEmi,
    this.emiHistory,
  });

  double? loanAmount;
  double? outstandingAmount;
  double? emiAmount;
  int? loanStartDateInMs;
  int? loanEndDateInMs;
  double? loanTenureInYears;
  UpcomingEmi? upcomingEmi;
  EmiHistory? emiHistory;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    loanAmount: json["loanAmount"] == null ? null : json["loanAmount"],
    outstandingAmount: json["outstandingAmount"] == null ? null : json["outstandingAmount"],
    emiAmount: json["emiAmount"] == null ? null : json["emiAmount"],
    loanStartDateInMs: json["loanStartDateInMs"] == null ? null : json["loanStartDateInMs"],
    loanEndDateInMs: json["loanEndDateInMs"] == null ? null : json["loanEndDateInMs"],
    loanTenureInYears: json["loanTenureInYears"] == null ? null : json["loanTenureInYears"],
    upcomingEmi: json["upcomingEmi"] == null ? null : UpcomingEmi.fromJson(json["upcomingEmi"]),
    emiHistory: json["emiHistory"] == null ? null : EmiHistory.fromJson(json["emiHistory"]),
  );

  Map<String, dynamic> toJson() => {
    "loanAmount": loanAmount == null ? null : loanAmount,
    "outstandingAmount": outstandingAmount == null ? null : outstandingAmount,
    "emiAmount": emiAmount == null ? null : emiAmount,
    "loanStartDateInMs": loanStartDateInMs == null ? null : loanStartDateInMs,
    "loanEndDateInMs": loanEndDateInMs == null ? null : loanEndDateInMs,
    "loanTenureInYears": loanTenureInYears == null ? null : loanTenureInYears,
    "upcomingEmi": upcomingEmi == null ? null : upcomingEmi?.toJson(),
    "emiHistory": emiHistory == null ? null : emiHistory?.toJson(),
  };
}

class EmiHistory {
  EmiHistory({
    this.totalAmountPaid,
    this.emiHistory,
  });

  double? totalAmountPaid;
  List<UpcomingEmi>? emiHistory;

  factory EmiHistory.fromJson(Map<String, dynamic> json) => EmiHistory(
    totalAmountPaid: json["totalAmountPaid"] == null ? null : json["totalAmountPaid"],
    emiHistory: json["emiHistory"] == null ? null : List<UpcomingEmi>.from(json["emiHistory"].map((x) => UpcomingEmi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalAmountPaid": totalAmountPaid == null ? null : totalAmountPaid,
    "emiHistory": emiHistory == null ? null : List<dynamic>.from(emiHistory!.map((x) => x.toJson())),
  };
}

class UpcomingEmi {
  UpcomingEmi({
    this.amount,
    this.dateInMs,
  });

  double? amount;
  int? dateInMs;

  factory UpcomingEmi.fromJson(Map<String, dynamic> json) => UpcomingEmi(
    amount: json["amount"] == null ? null : json["amount"],
    dateInMs: json["dateInMs"] == null ? null : json["dateInMs"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
    "dateInMs": dateInMs == null ? null : dateInMs,
  };
}
