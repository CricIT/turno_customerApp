import 'package:turno_customer_application/domain/entities/vehicle.dart';

abstract class VehicleRepository {
  Future<Vehicle> getVehicleDetails(String mobile);
}
