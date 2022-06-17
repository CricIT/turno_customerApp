import 'package:turno_customer_application/app/core/usecases/pram_usecase.dart';
import 'package:turno_customer_application/domain/entities/vehicle.dart';
import 'package:turno_customer_application/domain/repositories/vehicle/vehicle_repository.dart';

class VehicleUseCase extends ParamUseCase<void, String> {
  final VehicleRepository _repo;
  VehicleUseCase(this._repo);

  @override
  Future<Vehicle> execute(String mobile) async {
    final response = await _repo.getVehicleDetails(mobile);
    return response;
  }
}
