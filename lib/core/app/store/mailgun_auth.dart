import 'dart:convert';
import 'package:http/http.dart' as http;

class BasicAuth {
  final String username;
  final String password;

  BasicAuth(this.username, this.password);

  Future<http.Response> sendRequest(String url, Map<String, String> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password')),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );
    return response;
  }
}