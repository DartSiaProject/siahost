class EnvPath {
  static const env = String.fromEnvironment("ENV");
  static const rootOldApi = String.fromEnvironment(
    "ROOT_OLD_API",
    defaultValue: "https://siastats.info",
  );
  static const userCredentials = String.fromEnvironment(
    "USER_CREDENTIALS",
    defaultValue: "credentials",
  );
  static const userPresence = String.fromEnvironment(
    "USER_PRESENCE",
    defaultValue: "presence",
  );
  static const rootApi = String.fromEnvironment(
    "ROOT_API",
    defaultValue: "https://api.siacentral.com",
  );
  static const rootIp = String.fromEnvironment(
    "ROOT_IP",
    defaultValue: "https://ipinfo.io",
  );
}
