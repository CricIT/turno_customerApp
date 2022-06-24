import 'package:dartz/dartz.dart';

import '../../entities/support.dart';

abstract class SupportRepository {
  Future<Either<String, Support>> getSupportDetails();
}
