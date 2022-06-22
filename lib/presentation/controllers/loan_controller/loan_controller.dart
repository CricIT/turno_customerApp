import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/constants/network_used_case.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:turno_customer_application/app/services/local_storage.dart';
import 'package:turno_customer_application/data/network/api_provider.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/domain/usecases/loan/loan_usecase.dart';

class LoanController extends GetxController {
  LoanController(this._loanUseCase);

  final LoanUseCase _loanUseCase;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  var _myLoanDetails = Rx<Loan?>(null);
  final store = Get.find<LocalStorageService>();
  var usedCaseScenarios = NetworkUsedCase.loading.obs;
  var isDataAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/LoanScreen');
  }

  Rx<Loan?> get getLoanDetails {
    return _myLoanDetails;
  }

  set setVehicleDeatils(
    Rx<Loan> loanDetails,
  ) {
    _myLoanDetails = loanDetails;
  }

  fetchLoanDetails() async {
    try {
      usedCaseScenarios.value = NetworkUsedCase.loading;
      final response = await _loanUseCase.execute(store.mobileNumber);
      response.fold((error) => _handleLoanDetailsErrorCase(error: error),
          (success) => _handleLoanDetailsSuccessCase(success.obs));
    } catch (exception) {
      _handleLoanDetailsErrorCase(exception: exception);
    }
  }

  _handleLoanDetailsErrorCase({String? error, Object? exception}) {
    if (exception is BadRequestException && exception.details == "Not found") {
      return usedCaseScenarios.value = NetworkUsedCase.usernotfound;
    }
    usedCaseScenarios.value = NetworkUsedCase.error;
    isDataAvailable.value = false;
    refreshController.refreshCompleted();
  }

  _handleLoanDetailsSuccessCase(Rx<Loan> success) {
    usedCaseScenarios.value = NetworkUsedCase.sucess;
    setVehicleDeatils = success;
    isDataAvailable.value = true;
    refreshController.refreshCompleted();
  }
}
