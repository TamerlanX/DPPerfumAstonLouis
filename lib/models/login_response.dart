class LoginResponse {
  late final String token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}