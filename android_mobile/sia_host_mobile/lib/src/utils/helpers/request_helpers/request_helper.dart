import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sia_host_mobile/src/utils/enums/http_request_enum.dart';

class RequestHelper {
  //*-- Https requests standard --*//

  static Future<http.Response> httpMethod({
    required HttpRequestType requestType,
    required String apiUri,
    Map<String, dynamic>? contentBody,
    Map<String, dynamic> anotherHeader = const {},
  }) async {
    var _response = http.Response("", 200);
    switch (requestType) {
      case HttpRequestType.post:
        _response = await http.post(
          Uri.parse(apiUri),
          headers: {
            ...anotherHeader,
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(contentBody),
        );
        break;
      case HttpRequestType.get:
        _response = await http.get(
          Uri.parse(apiUri),
          headers: {
            ...anotherHeader,
            HttpHeaders.contentTypeHeader: "application/json",
          },
        );
        break;
      case HttpRequestType.put:
        // todo : requète pour "update" une donnée
        break;
      case HttpRequestType.delete:
        // todo : requète pour "delete" une donnée
        break;
      case HttpRequestType.patch:
        // todo : requète pour "update partiellement" une donnée
        break;
      case HttpRequestType.head:
        // todo : je dois faire une recherche pour comprendre cette methode
        break;
      case HttpRequestType.options:
        // todo : je dois faire une recherche pour comprendre cette methode
        break;
      default:
    }

    return _response;
  }

  //*-- https requests hors-standard --*//
}
