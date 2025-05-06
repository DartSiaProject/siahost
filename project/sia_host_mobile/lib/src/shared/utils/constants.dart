import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

const renterdAddressPattern =
    r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';

const String ipInfoToken = String.fromEnvironment('IPINFO_TOKEN');
