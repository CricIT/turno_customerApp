import 'package:turno_customer_application/data/network/apis/login_api.dart';
import 'package:turno_customer_application/domain/repositories/auth/login_repository.dart';

import '../../domain/entities/user.dart';

class LoginRepositoryIml extends LoginRepository {
  @override
  Future<User> generateOTP(String mobile) async {
    await LoginAPI.login(mobile).request();
    return User(mobile: mobile);
  }
}
