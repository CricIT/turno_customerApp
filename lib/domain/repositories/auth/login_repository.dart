import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';



abstract class LoginRepository {
  Future<Either<String, Auth>> generateOTP(String mobile);
}
