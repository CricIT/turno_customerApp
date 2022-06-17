import 'package:turno_customer_application/data/network/apis/vehicle_api.dart';
import 'package:turno_customer_application/domain/entities/vehicle.dart';
import 'package:turno_customer_application/domain/repositories/vehicle/vehicle_repository.dart';

class VehicleRepositoryIml extends VehicleRepository {
  @override
  Future<Vehicle> getVehicleDetails(String mobile) async {
    final response = await VehicleAPI.fetch(mobile).request();
    Map<String, dynamic> data = response["payload"];
    print(data);
    return Vehicle.fromJson(data);
  }
}
