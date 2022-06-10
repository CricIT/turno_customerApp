import 'package:get/get_connect.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';

abstract class LoginRepository {
  Future<Auth> generateOTP(String mobile);
}
