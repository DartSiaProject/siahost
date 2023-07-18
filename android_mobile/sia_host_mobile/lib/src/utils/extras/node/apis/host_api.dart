import 'package:flutter_dotenv/flutter_dotenv.dart';

final getHostApi = "${dotenv.env['ROOT_API']}/hosts-api/allhosts";
