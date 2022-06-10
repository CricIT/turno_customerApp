import 'package:tuple/tuple.dart';
import 'package:turno_customer_application/app/core/usecases/pram_usecase.dart';
import 'package:turno_customer_application/domain/entities/auth.dart';
import 'package:turno_customer_application/domain/repositories/auth/otp_repository.dart';

class OtpUseCase extends ParamUseCase<void, Tuple2> {
  final OtpRepository _otpRepository;
  OtpUseCase(this._otpRepository);

  @override
  Future<Auth> execute(Tuple2 params) {
    return _otpRepository.verifyOTP(params.item1, params.item2);
  }
}
