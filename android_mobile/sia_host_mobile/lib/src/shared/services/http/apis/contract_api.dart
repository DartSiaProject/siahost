import 'package:flutter_dotenv/flutter_dotenv.dart';

var getActiveContractsApi =
    "${dotenv.env['ROOT_OLD_API']}/dbs/activecontracts.json";
