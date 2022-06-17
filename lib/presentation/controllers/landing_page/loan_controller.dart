import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/domain/usecases/loan/loan_usecase.dart';

class LoanController extends GetxController {
  LoanController(this._loanUseCase);
  final LoanUseCase _loanUseCase;
  Future<Loan>? myLoanDetails;

  @override
  void onInit() {
    super.onInit();
    myLoanDetails = fetchLoanDetails();
  }

  Future<Loan> fetchLoanDetails() async {
    String mobile = '7093880128';
    final response = await _loanUseCase.execute(mobile);
    debugPrint(response.toString());
    return response;
  }
}
