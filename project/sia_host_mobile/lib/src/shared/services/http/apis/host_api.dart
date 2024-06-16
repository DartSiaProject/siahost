import '../../../constants/envs_const.dart';

// var getAllHostApi = "${dotenv.env['ROOT_API']}:3510/hosts-api/allhosts";

var getAllHostApi = "${EnvPath.rootApi}/v2/hosts/list";
String getAddressCountryHostApi({required String hostIp}) =>
    "${EnvPath.rootIp}/$hostIp?token=99ab4273e37a2f";
