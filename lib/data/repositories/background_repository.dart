



import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import 'package:turno_customer_application/domain/repositories/background_services/background_repository.dart';
import '../../app/services/local_storage.dart';
import '../../domain/entities/success.dart';
import '../network/apis/background_api.dart';

class BackGroundRepositoryIml extends BackGroundServiceRepository {

  @override
  Future<Success> pushSmsDumpToBackEnd(String mobile,String dataPushAt,  List<SmsMessage> smsDump) async {
   final store= Get.find<LocalStorageService>();
    final response = Success.fromJson(await BackGroundAPI.pushSmsDump(mobile, dataPushAt, smsDump).request());
    if(response.status=='success'){
      store.setLastPushDateTime=dataPushAt;
    }
    return response;

  }
}
