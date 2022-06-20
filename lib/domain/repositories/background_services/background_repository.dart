


import 'package:telephony/telephony.dart';



abstract class BackGroundServiceRepository{
  Future<void> pushSmsDumpToBackEnd(String mobile,String dataPushAt,List<SmsMessage> smsDump);

}