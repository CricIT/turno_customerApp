import 'package:turno_customer_application/domain/entities/auth.dart';
import 'package:turno_customer_application/domain/repositories/auth/otp_repository.dart';
import '../network/apis/otp_api.dart';

class OtpRepositoryIml extends OtpRepository {
  @override
  Future<Auth> verifyOTP(String mobile, String otp) async {
    final response = await OtpAPI.verify(mobile, otp).request();
    return Auth.fromJson(response);
  }
}
