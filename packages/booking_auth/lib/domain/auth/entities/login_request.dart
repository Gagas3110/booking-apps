class LoginRequest {
  String? username;
  String? password;
  int? expiresInMins;

  LoginRequest(
      {required this.username,
      required this.password,
      required this.expiresInMins});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    expiresInMins = json['expiresInMins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['expiresInMins'] = expiresInMins;
    return data;
  }
}
