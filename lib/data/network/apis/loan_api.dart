import 'dart:io';

import 'package:turno_customer_application/data/network/api_endpoint.dart';
import 'package:turno_customer_application/data/network/api_request_representable.dart';

import '../api_provider.dart';

class LoanAPI implements APIRequestRepresentable {
  String? mobile;

  LoanAPI._({required this.mobile});

  LoanAPI.fetch(String mobile) : this._(mobile: mobile);

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.loanapi;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    return "$mobile/loan";
  }

  @override
  get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
