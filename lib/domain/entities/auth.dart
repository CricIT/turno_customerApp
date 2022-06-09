class Auth {
  Auth({
    this.statusCode,
    this.status,
    this.message,
  });

  String? statusCode;
  String? status;
  String? message;

  factory Auth.fromJson(Map<String, dynamic>? json) {
    return Auth(
      statusCode: json?['statusCode'] as String?,
      status: json?['status'] as String?,
      message: json?['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'status': status,
        'message': message,
      };
}
