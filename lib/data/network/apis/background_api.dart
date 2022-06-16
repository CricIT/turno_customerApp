import 'dart:io';

import 'package:telephony/telephony.dart';
import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_provider.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

class BackGroundAPI implements APIRequestRepresentable {
  String? mobile;
  List<SmsMessage> dump;

  BackGroundAPI._({required this.mobile, required this.dump});

  BackGroundAPI.pushSmsDump(String mobile, List<SmsMessage> dump) : this._(mobile: mobile, dump: dump);

  @override
  String get endpoint => APIEndpoint.otpapi;

  @override
  String get path {
    return "";
  }

  @override
  get query => null;

  @override
  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  Map<String, String> get body {
    return {"mobile": "$mobile", "sms": "$dump"};
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint;
}
