import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

String translateErrorMessage(BuildContext context, DartSiaException exception) {
  if (exception.message.isNotEmpty) {
    return exception.message;
  }
  final l10n = context.l10n;
  switch (exception.error) {
    case ResponseStatus.cancelled:
      return l10n.errorCancelled;
    case ResponseStatus.connectionTimeout:
      return l10n.errorConnectionTimeout;
    case ResponseStatus.noInternet:
      return l10n.errorNoInternet;
    case ResponseStatus.receiveTimeout:
      return l10n.errorReceiveTimeout;
    case ResponseStatus.sendTimeout:
      return l10n.errorSendTimeout;
    case ResponseStatus.invalidCertificate:
      return l10n.errorInvalidCertificate;
    case ResponseStatus.unAuthorized:
      return l10n.errorUnauthorized;
    case ResponseStatus.forbidden:
      return l10n.errorForbidden;
    case ResponseStatus.badRequest:
      return l10n.errorBadRequest;
    case ResponseStatus.notFound:
      return l10n.errorNotFound;
    case ResponseStatus.conflict:
      return l10n.errorConflict;
    case ResponseStatus.badManip:
      return l10n.errorBadManip;
    case ResponseStatus.accountDisabled:
      return l10n.errorAccountDisabled;
    case ResponseStatus.unprocessibleEntity:
      return l10n.errorUnprocessableEntity;
    case ResponseStatus.internalServerError:
      return l10n.errorInternalServer;
    case ResponseStatus.provider:
      return l10n.errorProvider;
    case ResponseStatus.other:
      return l10n.errorOther;
    case ResponseStatus.badMethod:
      return l10n.errorBadMethod;
    case ResponseStatus.unknown:
      return l10n.errorUnknown;
    case ResponseStatus.noStoragePermission:
      return l10n.noStoragePermission;
    case ResponseStatus.notEnoughSpace:
      return l10n.notEnoughSpace;
  }
}
