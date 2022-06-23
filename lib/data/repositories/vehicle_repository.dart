import 'package:dartz/dartz.dart';
import 'package:turno_customer_application/data/network/apis/vehicle_api.dart';
import 'package:turno_customer_application/domain/entities/vehicle.dart';
import 'package:turno_customer_application/domain/repositories/vehicle/vehicle_repository.dart';

class VehicleRepositoryIml extends VehicleRepository {
  @override
  Future<Either<String, Vehicle>> getVehicleDetails(String mobile) async {
    final response = Vehicle.fromJson(await VehicleAPI.fetch(mobile).request());
    if (response.status == "success") {
      return Right(response);
    } else {
      return Left("Something went wrong");
    }
  }
}
