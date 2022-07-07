import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/data/network/apis/loan_api.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/domain/repositories/loan/loan_repository.dart';

class LoanRepositoryIml extends LoanRepository {
  @override
  Future<Either<String, Loan>> getLoanDetails(String mobile) async {
    final response = Loan.fromJson(await LoanAPI.fetch(mobile).request());
    if (response.status == "success") {
      return Right(response);
    } else {
      return const Left("Something went wrong");
    }
  }
}
