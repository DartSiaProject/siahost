import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

const renterdAddressPattern =
    r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';

const String ipInfoToken = String.fromEnvironment('IPINFO_TOKEN');

const applicationName = 'DartSia';

const String bucketNamePattern =
    r'^(?!\d+\.\d+\.\d+\.\d+$)(?!.*\.\.)(?!.*\.$)[a-zA-Z0-9]([a-zA-Z0-9\-\.]{1,61}[a-zA-Z0-9])?$';

// coin market cap api_key_var
const String coinMarketCapApiVar = 'CMC_PRO_API_KEY';
const String coinMarketCapApiKey = String.fromEnvironment(coinMarketCapApiVar);
