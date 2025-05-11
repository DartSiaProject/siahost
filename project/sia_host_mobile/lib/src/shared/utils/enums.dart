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
  badMethod,
  other,

  noStoragePermission,
  notEnoughSpace;
}

enum StateStatus {
  initial,
  loading,
  success,
  failure,
  searching,
  searchingFailure,
  paginating,
  paginatingFailure,
  sorting,
  sortingFailure,
  filtrering,
  filtreringFailure,
  dismissing,
  dismissingFailure,
  dismissed,
  updating,
}

enum SupportedFileType {
  image('Images'),
  video('Videos'),
  audio('Audios'),
  document('Documents'),
  pdf('Pdfs'),
  txt('Texts'),
  archive('Archives'),
  other('Others');

  const SupportedFileType(this.dirName);

  final String dirName;
}

enum FileActionEnum {
  download,
  upload,
  delete,
  rename,
  copy,
  move,
  share,
  open,
  openWith,
  openInNewTab,
  openInNewWindow,
  openInApp,
  openInBrowser,
  openInFileManager,
}

enum OpeningFileStatus {
  canOpen,
  canNotOpen,
}
