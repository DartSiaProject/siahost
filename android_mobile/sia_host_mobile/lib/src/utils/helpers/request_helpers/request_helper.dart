import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<http.Response> post({
    required String apiUri,
    Map<String, dynamic>? contentBody,
    Map<String, dynamic> anotherHeader = const {},
  }) async {
    var _response = await http.post(
      Uri.parse(apiUri),
      headers: {
        ...anotherHeader,
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: json.encode(contentBody),
    );
    return _response;
  }

  static Future<http.Response> get({
    required String apiUri,
    Map<String, dynamic> anotherHeader = const {},
  }) async {
    var _response = await http.get(
      Uri.parse(apiUri),
      headers: {
        ...anotherHeader,
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    return _response;
  }

  Future<String> put() async {
    return "";
  }

  Future<String> delete() async {
    return "";
  }

  Future<String> patch() async {
    return "";
  }

  Future<String> head() async {
    return "";
  }

  Future<String> options() async {
    return "";
  }
}
