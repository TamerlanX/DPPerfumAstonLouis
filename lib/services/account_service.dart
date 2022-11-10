import 'package:dp_perfum/models/login_response.dart';
import 'package:dp_perfum/services/base_http_service.dart';

class AccountService extends BaseHttpService {
  Future<LoginResponse> login(String username, String password) async {
    final body = { 'username': username, 'password': password};
    var json = await post('login', body);
    return LoginResponse.fromJson(json);
  }
}