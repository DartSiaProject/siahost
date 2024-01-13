import 'package:flutter_dotenv/flutter_dotenv.dart';

// var getAllHostApi = "${dotenv.env['ROOT_API']}:3510/hosts-api/allhosts";

var getAllHostApi = "${dotenv.env['ROOT_API']}/v2/hosts/list";
String getAddressCountryHostApi({required String hostIp}) =>
    "${dotenv.env['ROOT_IP']}/$hostIp?token=99ab4273e37a2f";
