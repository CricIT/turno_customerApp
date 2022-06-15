import 'emi.dart';

class Loan {
  String? mobile;
  double? loanAmount;
  double? outStandingAmount;
  double? emiAmount;
  String? loanStartDate;
  String? loanEndDate;
  double? totalAmountPaid;
  EMI? upcomingEMI;
  List<EMI>? emiHistory;

  Loan({
    this.mobile,
    this.loanAmount,
    this.outStandingAmount,
    this.emiAmount,
    this.loanStartDate,
    this.loanEndDate,
    this.totalAmountPaid,
    this.upcomingEMI,
    this.emiHistory,
  });

  factory Loan.fromJson(Map<String, dynamic>? json) {
    return Loan(
      mobile: json?['mobile'],
      loanAmount: json?['loanAmount'],
      outStandingAmount: json?['outstandingAmount'],
      emiAmount: json?['emiAmount'],
      loanStartDate: json?['loanStartDateInMs'],
      loanEndDate: json?['loanEndDateInMs'],
      upcomingEMI: EMI.fromJson(json?['upcomingEmi']),
      emiHistory: json?['emiHistory'],
      totalAmountPaid: json?['totalAmountPaid'],
    );
  }
}
