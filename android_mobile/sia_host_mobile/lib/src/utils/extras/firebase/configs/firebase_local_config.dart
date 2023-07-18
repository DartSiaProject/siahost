/// Remove the comments slash and use the function

  //*-- Authentification --
//  Future<void> configureFirebaseAuth() async {
//   String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
//   int configPort = const int.fromEnvironment("AUTH_EMU_PORT");
//   // Android emulator must be pointed to 10.0.2.2
//   var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   var host = configHost.isNotEmpty ? configHost : defaultHost;
//   var port = configPort != 0 ? configPort : 9099;
//   await FirebaseAuth.instance.useAuthEmulator(host, port);
//   debugPrint('Using Firebase Auth emulator on: $host:$port');
// }

//*-- CloudFirestore --
// void _configureFirebaseFirestore() {
//   String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
//   int configPort = const int.fromEnvironment("DB_EMU_PORT");
//   // Android emulator must be pointed to 10.0.2.2
//   var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   var host = configHost.isNotEmpty ? configHost : defaultHost;
//   var port = configPort != 0 ? configPort : 8080;
//   FirebaseFirestore.instance.settings = Settings(
//     host: '$host:$port',
//     sslEnabled: false,
//     persistenceEnabled: false,
//   );
//   debugPrint('Using Firebase Firestore emulator on: $host:$port');
// }

//*-- FirebaseStorage --
// Future<void> configureFirebaseStorage() async {
//   String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
//   int configPort = const int.fromEnvironment("STORAGE_EMU_PORT");
//   // Android emulator must be pointed to 10.0.2.2
//   var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   var host = configHost.isNotEmpty ? configHost : defaultHost;
//   var port = configPort != 0 ? configPort : 9199;
//   await FirebaseStorage.instance.useStorageEmulator(host, port);
//   debugPrint('Using Firebase Storage emulator on: $host:$port');
// }

//*-- CloudFunctions --
// void configureFirebaseFunctions() async {
//   String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
//   int configPort = const int.fromEnvironment("FUNCTIONS_EMU_PORT");
//   // Android emulator must be pointed to 10.0.2.2
//   var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   var host = configHost.isNotEmpty ? configHost : defaultHost;
//   var port = configPort != 0 ? configPort : 5001;
//   FirebaseFunctions.instance.useFunctionsEmulator(host, port);
//   debugPrint('Using Firebase Functions emulator on: $host:$port');
// }
  
