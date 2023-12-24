import 'package:flutter_dotenv/flutter_dotenv.dart';

var getNetworkApi = "${dotenv.env['ROOT_API']}/dbs/network_status.json";
