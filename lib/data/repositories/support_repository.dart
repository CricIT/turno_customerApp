import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/data/network/apis/support_api.dart';
import 'package:turno_customer_application/domain/repositories/support/support_repository.dart';
import '../../domain/entities/support.dart';

class SupportRepositoryIml extends SupportRepository {
  @override
  Future<Either<String, Support>> getSupportDetails() async {
    final response = Support.fromJson(await SupportAPI.fetch().request());
    if (response.status == "success") {
      return Right(response);
    } else {
      return Left(response.message!);
    }
  }
}
