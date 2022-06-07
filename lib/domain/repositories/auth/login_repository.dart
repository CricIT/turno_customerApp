import 'package:turno_customer_application/domain/entities/user.dart';

abstract class LoginRepository {
  Future<User> generateOTP(String mobile);
}
