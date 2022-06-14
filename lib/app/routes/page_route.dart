import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_binding.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_binding.dart';
import 'package:turno_customer_application/presentation/controllers/payment/payment_history_binding.dart';
import 'package:turno_customer_application/presentation/pages/language.dart';
import 'package:turno_customer_application/presentation/pages/login.dart';
import 'package:turno_customer_application/presentation/pages/otp.dart';
import 'package:turno_customer_application/presentation/pages/payment_history.dart';
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
      )
    ];
  }
}
