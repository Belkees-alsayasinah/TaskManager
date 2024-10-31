import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Configurations/server_config.dart';

class ApiService {
  Future<http.Response> postRequest(String url, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    final fullUrl = Uri.parse(ServerConfig.domainNameServer + url);

    return await http.post(
      fullUrl,
      body: jsonEncode(body),
      headers: headers ?? {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> getRequest(String url) async {
    final fullUrl = Uri.parse(ServerConfig.domainNameServer + url);
    return await http.get(fullUrl);
  }

  Future<http.Response> deleteRequest(String url) async {
    final fullUrl = Uri.parse(ServerConfig.domainNameServer + url);
    return await http.delete(fullUrl);
  }

  Future<http.Response> putRequest(String url, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    final fullUrl = Uri.parse(ServerConfig.domainNameServer + url);

    return await http.put(
      fullUrl,
      body: jsonEncode(body),
      headers: headers ?? {'Content-Type': 'application/json'},
    );
  }
}
