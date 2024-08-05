import 'dart:io';

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
}
