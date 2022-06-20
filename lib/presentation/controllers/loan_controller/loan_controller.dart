import 'package:get/get.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/domain/usecases/loan/loan_usecase.dart';

class LoanController extends GetxController {
  LoanController(this._loanUseCase);
  final LoanUseCase _loanUseCase;
  final store = Get.find<LocalStorageService>();
  Future<Loan>? myLoanDetails;

  @override
  void onInit() {
    super.onInit();
  }

  Future<Loan> fetchLoanDetails() async {
    String mobile = store.mobileNumber;
    final response = await _loanUseCase.execute(mobile);
    return response;
  }
}
