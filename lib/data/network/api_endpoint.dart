class APIEndpoint {
  static String baseUrl = "http://3.6.229.194:8888";

  static String get loginapi => "$baseUrl/otp/generateAndSend?mobile=";

  static String get otpapi => "$baseUrl/otp/verify";
}
