class User {
  User({this.mobile});

  String? mobile;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      mobile: json?['mobile'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
      };
}
