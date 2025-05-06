import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/services/api_client.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@LazySingleton()
class LocationRepository {
  LocationRepository(this._api);

  final ApiClient _api;

  Future<String> getLocationAddress(String networkAddress) async {
    try {
      var url = 'https://ipinfo.io/';

      final ipAddress = await HostHelper.convertDnsToIp(
        dnsAddress: networkAddress,
      );

      if (ipAddress.isEmpty) {
        return '---';
      }

      url += ipAddress;

      final response = await _api.get(
        url,
        queryParameters: ipInfoToken.isNotEmpty ? {'token': ipInfoToken} : null,
      );
      final data = response.data as Map<String, dynamic>;

      return '${data['city']}, ${data['region']}, ${data['country']}';
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
