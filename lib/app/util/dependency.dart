import 'package:get/get.dart';
import 'package:turno_customer_application/data/repositories/loan_repository.dart';
import 'package:turno_customer_application/data/repositories/login_repository.dart';
import 'package:turno_customer_application/data/repositories/otp_repository.dart';
import 'package:turno_customer_application/data/repositories/support_repository.dart';
import 'package:turno_customer_application/data/repositories/vehicle_repository.dart';
import 'package:turno_customer_application/presentation/controllers/more/more_controller.dart';
import 'package:turno_customer_application/presentation/controllers/more/new_loan_controller.dart';
import 'package:turno_customer_application/presentation/controllers/more/refer_controller.dart';
import 'package:turno_customer_application/presentation/controllers/more/vehicle_catalouge_controller.dart';
import 'package:turno_customer_application/presentation/controllers/permissions/permission_controller.dart';
import '../../data/repositories/background_repository.dart';
import '../services/app_update.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => LoginRepositoryIml(), fenix: true);
    Get.lazyPut(() => OtpRepositoryIml(), fenix: true);
    Get.lazyPut(() => MoreController(), fenix: true);
    Get.lazyPut(() => VehicleRepositoryIml(), fenix: true);
    Get.lazyPut(() => LoanRepositoryIml(), fenix: true);
    Get.lazyPut(() => PermissionsController(), fenix: true);
    Get.lazyPut(() => BackGroundRepositoryIml(), fenix: true);
    Get.lazyPut(() => VehicleCatalougeController(), fenix: true);
    Get.lazyPut(() => ReferController(), fenix: true);
    Get.lazyPut(() => NewLoanController(), fenix: true);
    Get.lazyPut(() => SupportRepositoryIml(), fenix: true);
    Get.lazyPut(() => AppUpdate(),fenix: true);
  }
}
