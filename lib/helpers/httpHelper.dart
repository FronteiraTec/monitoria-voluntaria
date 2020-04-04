import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String baseUrl;
  String headers;

  void setHeaders() {}

  HttpHelper(this.baseUrl);

  Future<Map<String, dynamic>> get(String path,
      [Map<String, String> query]) async {
    // query.updateAll((key, val) => query[key] = val.toString());

    final url = Uri.http(baseUrl, path, query);

    try {
      final response = await http.get(url);

      return {
        "statusCode": response.statusCode,
        "body": json.decode(response.body),
      };
    } catch (err) {
      throw err;
    }
  }

  Future<Map<String, Object>> post(String path,
      Map<String, Object> body, [Map<String, Object> query]) async {

    final url = Uri.http(baseUrl, path, query);

    try {
      final response = await http.post(url, body: body);

      return {
        "statusCode": response.statusCode,
        "body": json.decode(response.body),
      };
    } catch (err) {
      throw err;
    }
  }

  String query(Map<String, Object> query) {
    return "?" +
        query.keys
            .map((key) {
              return "&$key=${query[key]}";
            })
            .join("")
            .substring(1);
  }

  String namedRoute(Map<String, Object> map,
      [Map<String, Object> query]) {
    final url = map.keys.map((key) {
      return "/$key/${map[key]}";
    }).join("");

    if (query == null) {
      return url;
    }
    
    return url + this.query(query);
  }
}
