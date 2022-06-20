import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_binding.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_binding.dart';
import 'package:turno_customer_application/presentation/controllers/mileage_history/mileage_binding.dart';
import 'package:turno_customer_application/presentation/controllers/payment/payment_history_binding.dart';
import 'package:turno_customer_application/presentation/pages/apply_new_loan.dart';
import 'package:turno_customer_application/presentation/pages/error.dart';
import 'package:turno_customer_application/presentation/pages/refer_and_earn.dart';
import 'package:turno_customer_application/presentation/pages/vehicle_catalouge.dart';
import 'package:turno_customer_application/presentation/widgets/coming_soon.dart';
import 'package:turno_customer_application/presentation/pages/best_charging_practice.dart';
import 'package:turno_customer_application/presentation/pages/language.dart';
import 'package:turno_customer_application/presentation/pages/login.dart';
import 'package:turno_customer_application/presentation/pages/mileage_history.dart';
import 'package:turno_customer_application/presentation/pages/otp.dart';
import 'package:turno_customer_application/presentation/pages/payment_history.dart';
import 'package:turno_customer_application/presentation/pages/permissions.dart';
import '../../presentation/controllers/charging_practice_controller/best_charging_practice_binding.dart';
import '../../presentation/controllers/landing_page/landing_page_binding.dart';
import '../../presentation/pages/landing_page.dart';
import 'app_route.dart';

class Routes {
  static List<GetPage> getAllPages() {
    return [
      GetPage(
        name: AppRoutes.LANDING_PAGE,
        page: () => const LandingPage(),
        binding: LandingPageBinding(),
      ),
      GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.OTP,
        page: () => const OtpScreen(),
        binding: OtpBinding(),
      ),
      GetPage(
        name: AppRoutes.LANGUAGE,
        page: () => ChooseLanguage(),
      ),
      GetPage(
        name: AppRoutes.PAYMENT_HISTORY,
        page: () => const PaymentHistory(),
        binding: PaymentHistoryBinding(),
      ),
      GetPage(
        name: AppRoutes.PERMISSIONS,
        page: () => const Permissions(),
      ),
      GetPage(
        name: AppRoutes.COMING_SOON,
        page: () => ComingSoon(
          showButton: true,
        ),
      ),
      GetPage(
        name: AppRoutes.MILEAGE_HISTORY,
        page: () => MileageHistory(),
        binding: MileageBinding(),
      ),
      GetPage(
        name: AppRoutes.BEST_PRACTICE,
        page: () => BestChargingPractice(),
        binding: BestChargingPracticeBinding(),
      ),
      GetPage(
        name: AppRoutes.VEHICLE_CATALOUGE,
        page: () => const VehicleCatalouge(),
      ),
      GetPage(
        name: AppRoutes.NEW_LOAN,
        page: () => const ApplyNewLoan(),
      ),
      GetPage(
        name: AppRoutes.REFER_AND_EARN,
        page: () => const ReferAndEarn(),
      ),
      GetPage(
        name: AppRoutes.ERROR,
        page: () => ErrorView(),
      )
    ];
  }
}
