class Support {
  SupportPayload? payload;
  String? status;
  String? message;
  String? error;

  Support({this.payload, this.status});

  Support.fromJson(Map<String, dynamic> json) {
    payload = json['payload'] != null
        ? SupportPayload.fromJson(json['payload'])
        : null;
    status = json['status'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class SupportPayload {
  String? customerCareContactNumber;

  SupportPayload({this.customerCareContactNumber});

  SupportPayload.fromJson(Map<String, dynamic> json) {
    customerCareContactNumber = json['customerCareContactNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCareContactNumber'] = customerCareContactNumber;
    return data;
  }
}
