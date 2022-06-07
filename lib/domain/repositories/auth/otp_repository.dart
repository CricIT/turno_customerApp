import 'package:turno_customer_application/domain/entities/user.dart';

abstract class OtpRepository {
  Future<User> verifyOTP(String mobile, String otp);
}
