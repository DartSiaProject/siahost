import 'package:http/http.dart';

abstract class FetchTheHostAddressCountryAbst {
  Future<Response> fetchTheAddressCountry({required String ipAddressConverted});
}
