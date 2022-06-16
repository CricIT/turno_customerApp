



import 'package:telephony/telephony.dart';
import 'package:turno_customer_application/domain/repositories/background_services/background_repository.dart';
import '../network/apis/background_api.dart';

class BackGroundRepositoryIml extends BackGroundServiceRepository {

  @override
  Future<void> pushSmsDumpToBackEnd(String mobile, List<SmsMessage> dump) async {
    BackGroundAPI.pushSmsDump(mobile, dump);
  }
}
