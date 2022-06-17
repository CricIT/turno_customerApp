import 'package:get/get_connect.dart';
import 'package:turno_customer_application/domain/entities/loan.dart';

abstract class LoanRepository {
  Future<Loan> getLoanDetails(String mobile);
}
