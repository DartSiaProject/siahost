import 'dart:convert';
import 'dart:io';

import '../../../logic/models/ip_info.dart';
import '../../extras/node/apis/host_api.dart';
import '../request_helpers/request_helper.dart';

class HostHelper {
  static Future<String> convertDnsToIp({required String dnsAddress}) async {
    var _ipAddress = "";
    try {
      var newDnsAddress = "";
      var oldDnsAddress = dnsAddress.split(":")[0].toString();
      if (oldDnsAddress.contains("[")) {
        oldDnsAddress = oldDnsAddress.replaceAll("[", "");
        oldDnsAddress = oldDnsAddress.replaceAll("]", "");
        newDnsAddress = oldDnsAddress;
      }
      newDnsAddress = oldDnsAddress;
      var internetAddressValue = await InternetAddress.lookup(newDnsAddress);
      _ipAddress = internetAddressValue.first.address;
    } catch (e) {
      print(e);
    }
    return _ipAddress;
  }

  static Future<String> getHostAddressCountry({required String dns}) async {
    var _townAndCountry = "";
    try {
      var _ipAddressConverted = await convertDnsToIp(dnsAddress: dns);
      var _responseHost = await RequestHelper.get(
        apiUri: getAddressCountryHostApi(hostIp: _ipAddressConverted),
      );
      if (_responseHost.statusCode == 200) {
        var _ipInfoModel = IpInfo.fromMap(json.decode(_responseHost.body));
        _townAndCountry = "${_ipInfoModel.city}, ${_ipInfoModel.country}";
      }
    } catch (e) {
      print(e);
    }
    return _townAndCountry;
  }
}
