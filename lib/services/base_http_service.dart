import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../utils/string_utils.dart';
import 'http_error.dart';

class AppHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class BaseHttpService {

  static Uri getUri(String action, { Map<String, String>? params })
  {
    var uri = Uri(scheme: 'http', host: '78.111.59.165', port: 8383, path: "d_p/hs/reportserver/api/$action", queryParameters: params);
    print(uri.toString());
    return uri;
  }

  Future<dynamic> post(String url, dynamic body, { Map<String, String>? params, Map<String, String>? headers }) async {

    //print(convert.jsonEncode(body));
    await _checkConnection();

    var response = await http.post(getUri(url, params: params),
        headers: getHeaders(headers),
        body: convert.jsonEncode(body)).setHttpTimeout();

    return _getJson(response);
  }

  Future<dynamic> get(String url, {Map<String, String>? params}) async {
    await _checkConnection();
    var response = await http.get(getUri(url, params: params), headers: getHeaders()).setHttpTimeout();
    return _getJson(response);
  }

  Future _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none) {
      throw const  HttpError(message: 'Cihaz internetə qoşulu deyil', code: 0);
    }
  }

  static Map<String, String> getHeaders([Map<String, String>? headers]) {

    var map = {
      'Accept-Language': 'az',
      'Content-Type': 'application/json'
    };

    final token = '';// AccountService.loginInfo?.token;
    if(!StringUtils.isEmpty(token)) {
      map.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    if(headers != null) {
      headers.forEach((key, value) {
        map.putIfAbsent(key, () => value);
      });
    }

    return map;
  }

  dynamic _getJson(http.Response response) {

    if (response.statusCode < 200 || response.statusCode > 299) {
      if (!StringUtils.isEmpty(response.body)) {
        var json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
        int code = response.statusCode;
        String message = json['message'] ?? 'Şəbəkə xətası: ${response.statusCode}';
        throw HttpError(code: code, message: message);
      }

      throw HttpError(code: response.statusCode, message: 'Şəbəkə xətası: ${response.statusCode}');
    }

    if (StringUtils.isEmpty(response.body)) {
      return null;
    }

    try {
      final json = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      return json;
    }
    catch (e) {
      throw HttpError(code: response.statusCode, message: 'Düzgün olmayan JSON');
    }
  }
}

extension on Future<http.Response> {
  Future<http.Response> setHttpTimeout() {
    return timeout(const Duration(seconds: 20),
        onTimeout: () => throw const HttpError(message: 'Server təyin olunan vaxt ərzində cavab vermədi', code: 0));
  }
}