import 'package:flutter_dotenv/flutter_dotenv.dart';

var getActiveContractsApi =
    "${dotenv.env['ROOT_API']}/dbs/activecontracts.json";
