import 'package:turno_customer_application/domain/entities/auth.dart';

abstract class OtpRepository {
  Future<Auth> verifyOTP(String mobile, String otp);
}
