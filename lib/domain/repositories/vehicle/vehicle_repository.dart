import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/domain/entities/vehicle.dart';



abstract class VehicleRepository {
  Future<Either<String, Vehicle>> getVehicleDetails(String mobile);
}
