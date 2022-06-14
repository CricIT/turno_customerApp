import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/data/network/apis/login_api.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';
import 'package:turno_customer_application/domain/repositories/auth/login_repository.dart';


class LoginRepositoryIml extends LoginRepository {

  @override
  Future<Either<String, Auth>> generateOTP(String mobile) async {
    final response = Auth.fromJson(await LoginAPI.login(mobile).request());
    if (response.statusCode == "308"){
      return Left(response.message!);
    } else {
      return Right(response);
    }
  }
}
