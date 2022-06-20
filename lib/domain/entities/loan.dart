import 'emi.dart';
import 'emi_history.dart';

class Loan {
  LoanPayload? payload;
  String? status;
  String? message;
  String? error;

  Loan({this.payload, this.status});

  Loan.fromJson(Map<String, dynamic> json) {
    payload =
        json['payload'] != null ? LoanPayload.fromJson(json['payload']) : null;
    status = json['status'];
    message = json['message'];
    error = json['error'];
  }
}

class LoanPayload {
  double? loanAmount;
  double? outStandingAmount;
  double? emiAmount;
  int? loanStartDate;
  int? loanEndDate;
  double? loanTenure;
  EMI? upcomingEMI;
  EmiHistory? emiHistory;

  LoanPayload({
    this.loanAmount,
    this.outStandingAmount,
    this.emiAmount,
    this.loanStartDate,
    this.loanTenure,
    this.loanEndDate,
    this.upcomingEMI,
    this.emiHistory,
  });

  LoanPayload.fromJson(Map<String, dynamic> json) {
    loanAmount = json['loanAmount'];
    outStandingAmount = json['outstandingAmount'];
    emiAmount = json['emiAmount'];
    loanTenure = json['loanTenureInYears'];
    loanStartDate = json['loanStartDateInMs'];
    loanEndDate = json['loanEndDateInMs'];
    upcomingEMI = EMI.fromJson(json['upcomingEmi']);
    emiHistory = EmiHistory.fromJson(json['emiHistory']);
  }
}
