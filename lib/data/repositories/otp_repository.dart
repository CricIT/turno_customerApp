import 'package:turno_customer_application/domain/entities/user.dart';
import 'package:turno_customer_application/domain/repositories/auth/otp_repository.dart';
import '../network/apis/otp_api.dart';

class OtpRepositoryIml extends OtpRepository {
  @override
  Future<User> verifyOTP(String mobile, String otp) async {
    final response = await OtpAPI.verify(mobile, otp).request();
    print(response);
    return User(mobile: mobile);
  }
}
