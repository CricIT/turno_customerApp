import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/app/core/usecases/no_param_usecase.dart';
import 'package:turno_customer_application/domain/repositories/support/support_repository.dart';

import '../../entities/support.dart';

class SupportUseCase extends NoParamUseCase {
  final SupportRepository _repo;
  SupportUseCase(this._repo);

  @override
  Future<Either<String, Support>> execute() async {
    return await _repo.getSupportDetails();
  }
}
