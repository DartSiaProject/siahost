enum AppLocales {
  fr,
  en,
}

enum ResponseStatus {
  cancelled,
  connectionTimeout,
  noInternet,
  receiveTimeout,
  sendTimeout,
  invalidCertificate,
  unknown,
  unAuthorized,
  forbidden,
  badRequest,
  notFound,
  conflict,
  badManip,
  accountDisabled,
  unprocessibleEntity,
  internalServerError,
  provider,
  other,
  badMethod;
}

enum StateStatus {
  initial,
  loading,
  success,
  failure,
  paginating,
  searching,
  paginatingFailure,
  searchingFailure,
}
