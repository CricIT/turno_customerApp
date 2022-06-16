


import 'package:dartz/dartz.dart';

import '../../../app/core/usecases/pram_usecase.dart';
import '../../repositories/background_services/background_repository.dart';

class BackGroundUseCase extends ParamUseCase<void, Tuple2> {
  final BackGroundServiceRepository _repo;
  BackGroundUseCase(this._repo);

  @override
  Future<void> execute(Tuple2 params) async {
     _repo.pushSmsDumpToBackEnd(params.value1,params.value2);
  }
}
