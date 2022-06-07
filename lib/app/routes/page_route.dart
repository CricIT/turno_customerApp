import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/auth/login_binding.dart';
import 'package:turno_customer_application/presentation/controllers/auth/otp_binding.dart';
import 'package:turno_customer_application/presentation/controllers/home/home_binding.dart';
import 'package:turno_customer_application/presentation/pages/login.dart';
import 'package:turno_customer_application/presentation/pages/otp.dart';

import '../../presentation/pages/home.dart';
import 'app_route.dart';

class Routes {
  static List<GetPage> getAllPages() {
    return [
      GetPage(
        name: AppRoutes.HOME,
        page: () => MyHomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.OTP,
        page: () => OtpScreen(),
        binding: OtpBinding(),
      ),
    ];
  }
}
