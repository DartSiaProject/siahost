import 'package:flutter_dotenv/flutter_dotenv.dart';

var getAllHostApi = "${dotenv.env['ROOT_API']}:3510/hosts-api/allhosts";
