import 'package:dp_perfum/models/login_response.dart';
import 'package:dp_perfum/services/base_http_service.dart';

class AccountService extends BaseHttpService {

  static LoginResponse? _loginInfo;
  static LoginResponse? get loginInfo => _loginInfo;

  Future<LoginResponse> login(String username, String password) async {
    final body = { 'username': username, 'password': password};
    var json = await post('login', body);
    _loginInfo = LoginResponse.fromJson(json);
    return _loginInfo!;
  }
}