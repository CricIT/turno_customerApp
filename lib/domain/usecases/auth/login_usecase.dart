import 'package:turno_customer_application/app/core/usecases/pram_usecase.dart';
import 'package:turno_customer_application/domain/repositories/auth/login_repository.dart';

class LoginUseCase extends ParamUseCase<void, String> {
  final LoginRepository _repo;
  LoginUseCase(this._repo);

  @override
  Future execute(String params) async {
    return await _repo.generateOTP(params);
  }
}
