import 'package:dartz/dartz.dart';
import 'package:get/get_connect.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import '../../../app/core/usecases/pram_usecase.dart';
import '../../repositories/loan/loan_repository.dart';

class LoanUseCase extends ParamUseCase<void, String> {
  final LoanRepository _repo;
  LoanUseCase(this._repo);

  @override
  Future<Either<String, Loan>> execute(String mobile) async {
    return await _repo.getLoanDetails(mobile);
  }
}
