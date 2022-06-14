import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/app/core/usecases/pram_usecase.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';
import 'package:turno_customer_application/domain/repositories/auth/login_repository.dart';


class LoginUseCase extends ParamUseCase<void, String> {
  final LoginRepository _repo;
  LoginUseCase(this._repo);

  @override
  Future<Either<String, Auth>> execute(String params) async {
    final response = await _repo.generateOTP(params);
    return response;
  }
}
