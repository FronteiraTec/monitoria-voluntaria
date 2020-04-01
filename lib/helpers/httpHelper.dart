import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpHelper {
  final String baseUrl;
  String headers;

  void setHeaders(){

  }

  HttpHelper(this.baseUrl);

   Future<Map<String, dynamic>> get(String path, [Map<String, String> query]) async {
    // query.updateAll((key, val) => query[key] = val.toString());

    final url = Uri.http(baseUrl, path, query);

    try {
      final response = await http.get(url);

      return {
        "statusCode": response.statusCode,
        "body": json.decode(response.body),
      };
    }
    catch(err) {
      throw err;
    }

  }
}