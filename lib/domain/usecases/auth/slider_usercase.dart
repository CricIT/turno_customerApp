import 'package:turno_customer_application/app/core/usecases/no_param_usecase.dart';
import 'package:turno_customer_application/app/core/usecases/pram_usecase.dart';
import 'package:turno_customer_application/domain/repositories/auth/slider_repository.dart';

class SliderUsecase extends NoParamUseCase{
  final SliderReopsitory _sliderReopsitory;
  SliderUsecase(this._sliderReopsitory);

  @override
  Future<void> execute() {
    return _sliderReopsitory.getSliderImages();
  }
}