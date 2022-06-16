import 'emi.dart';
import 'emi_history.dart';

class Loan {
  double? loanAmount;
  double? outStandingAmount;
  double? emiAmount;
  int? loanStartDate;
  int? loanEndDate;
  double? loanTenure;
  EMI? upcomingEMI;
  EmiHistory? emiHistory;

  Loan({
    this.loanAmount,
    this.outStandingAmount,
    this.emiAmount,
    this.loanStartDate,
    this.loanTenure,
    this.loanEndDate,
    this.upcomingEMI,
    this.emiHistory,
  });

  factory Loan.fromJson(Map<String, dynamic>? json) {
    return Loan(
      loanAmount: json?['loanAmount'],
      outStandingAmount: json?['outstandingAmount'],
      emiAmount: json?['emiAmount'],
      loanTenure: json?['loanTenureInYears'],
      loanStartDate: json?['loanStartDateInMs'],
      loanEndDate: json?['loanEndDateInMs'],
      upcomingEMI: EMI.fromJson(json?['upcomingEmi']),
      emiHistory: EmiHistory.fromJson(json?['emiHistory']),
    );
  }
}
