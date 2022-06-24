import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turno_customer_application/app/core/tracker/tracker.dart';
import 'package:turno_customer_application/domain/entities/support.dart';
import 'package:turno_customer_application/domain/usecases/support/support_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/constants/network_used_case.dart';
import '../../../data/network/api_provider.dart';

class SupportController extends GetxController {
  SupportController(this._supportUseCase);

  final SupportUseCase _supportUseCase;
  var _supportDetails = Rx<Support?>(null);
  String? customerCareContactNumber;

  var usedCaseScenarios = NetworkUsedCase.loading.obs;
  var isDataAvailable = false.obs;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    TrackHandler.trackScreen(screenName: '/SupportScreen');
  }

  Rx<Support?> get getSupportDetails {
    return _supportDetails;
  }

  set setSupportDetails(Rx<Support> supportDetails) {
    _supportDetails = supportDetails;
  }

  fetchSupportDetails() async {
    try {
      usedCaseScenarios.value = NetworkUsedCase.loading;
      final response = await _supportUseCase.execute();

      response.fold((error) => _handleSupportErrorCase(error: error),
          (success) => _handleSupportSuccessCase(success.obs));
    } catch (exception) {
      _handleSupportErrorCase(exception: exception);
    }
  }

  _handleSupportErrorCase({String? error, Object? exception}) {
    if (exception is BadRequestException && exception.details == "Not found") {
      return usedCaseScenarios.value = NetworkUsedCase.usernotfound;
    }
    usedCaseScenarios.value = NetworkUsedCase.error;
    isDataAvailable.value = false;
    refreshController.refreshCompleted();
  }

  _handleSupportSuccessCase(Rx<Support> support) {
    usedCaseScenarios.value = NetworkUsedCase.sucess;
    setSupportDetails = support;
    isDataAvailable.value = true;
    refreshController.refreshCompleted();
  }

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: getSupportDetails.value?.payload!.customerCareContactNumber,
    );
    await launchUrl(launchUri);
  }
}
