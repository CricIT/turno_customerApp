import 'package:turno_customer_application/data/network/apis/loan_api.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';
import 'package:turno_customer_application/domain/repositories/loan/loan_repository.dart';

class LoanRepositoryIml extends LoanRepository {
  @override
  Future<Loan> getLoanDetails(String mobile) async {
    final response = await LoanAPI.fetch(mobile).request();
    Map<String, dynamic> data = response["payload"];
    print(data);
    return Loan.fromJson(data);
  }
}
