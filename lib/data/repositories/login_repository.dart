import 'package:get/get_connect.dart';
import 'package:turno_customer_application/data/network/apis/login_api.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';
import 'package:turno_customer_application/domain/repositories/auth/login_repository.dart';

class LoginRepositoryIml extends LoginRepository {
  @override
  Future<Auth> generateOTP(String mobile) async {
    final response = await LoginAPI.login(mobile).request();
    return Auth.fromJson(response);
  }
}
