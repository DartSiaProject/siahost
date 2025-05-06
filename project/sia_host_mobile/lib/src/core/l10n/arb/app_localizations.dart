import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// Title of the app
  ///
  /// In en, this message translates to:
  /// **'DartSia'**
  String get appTitle;

  /// No description provided for @onTrack.
  ///
  /// In en, this message translates to:
  /// **'On track'**
  String get onTrack;

  /// No description provided for @totalStorage.
  ///
  /// In en, this message translates to:
  /// **'Total Storage'**
  String get totalStorage;

  /// No description provided for @usedStorage.
  ///
  /// In en, this message translates to:
  /// **'Used Storage'**
  String get usedStorage;

  /// No description provided for @availableStorage.
  ///
  /// In en, this message translates to:
  /// **'Available Storage'**
  String get availableStorage;

  /// No description provided for @totalContracts.
  ///
  /// In en, this message translates to:
  /// **'Total Contracts'**
  String get totalContracts;

  /// No description provided for @activeContracts.
  ///
  /// In en, this message translates to:
  /// **'Active Contracts'**
  String get activeContracts;

  /// No description provided for @uploadPrice.
  ///
  /// In en, this message translates to:
  /// **'Upload Price'**
  String get uploadPrice;

  /// No description provided for @downloadPrice.
  ///
  /// In en, this message translates to:
  /// **'Download Price'**
  String get downloadPrice;

  /// No description provided for @storagePrice.
  ///
  /// In en, this message translates to:
  /// **'Storage Price'**
  String get storagePrice;

  /// No description provided for @currentStatus.
  ///
  /// In en, this message translates to:
  /// **'Current Status'**
  String get currentStatus;

  /// No description provided for @acceptingContracts.
  ///
  /// In en, this message translates to:
  /// **'Accepting Contract'**
  String get acceptingContracts;

  /// No description provided for @hostPublicAddress.
  ///
  /// In en, this message translates to:
  /// **'Host Public Address'**
  String get hostPublicAddress;

  /// No description provided for @addressCopiedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address Copied successfully'**
  String get addressCopiedSuccessfully;

  /// No description provided for @scPerTB.
  ///
  /// In en, this message translates to:
  /// **'SC/TB'**
  String get scPerTB;

  /// No description provided for @siaCoin.
  ///
  /// In en, this message translates to:
  /// **'SC'**
  String get siaCoin;

  /// No description provided for @teraByte.
  ///
  /// In en, this message translates to:
  /// **'TB'**
  String get teraByte;

  /// No description provided for @petaByte.
  ///
  /// In en, this message translates to:
  /// **'PB'**
  String get petaByte;

  /// No description provided for @host.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get host;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// No description provided for @buckets.
  ///
  /// In en, this message translates to:
  /// **'Buckets'**
  String get buckets;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @addFile.
  ///
  /// In en, this message translates to:
  /// **'Add File'**
  String get addFile;

  /// No description provided for @openFile.
  ///
  /// In en, this message translates to:
  /// **'Open File'**
  String get openFile;

  /// No description provided for @deleteFile.
  ///
  /// In en, this message translates to:
  /// **'Delete File'**
  String get deleteFile;

  /// No description provided for @renameFile.
  ///
  /// In en, this message translates to:
  /// **'Rename File'**
  String get renameFile;

  /// No description provided for @copyFile.
  ///
  /// In en, this message translates to:
  /// **'Copy File'**
  String get copyFile;

  /// No description provided for @moveFile.
  ///
  /// In en, this message translates to:
  /// **'Move File'**
  String get moveFile;

  /// No description provided for @notice.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get notice;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// No description provided for @navMyHost.
  ///
  /// In en, this message translates to:
  /// **'My Host'**
  String get navMyHost;

  /// No description provided for @navConfig.
  ///
  /// In en, this message translates to:
  /// **'Configs'**
  String get navConfig;

  /// No description provided for @navFiles.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get navFiles;

  /// No description provided for @navNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get navNotifications;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Network Overview'**
  String get homeTitle;

  /// No description provided for @currentActiveHosts.
  ///
  /// In en, this message translates to:
  /// **'Current Active \nHosts'**
  String get currentActiveHosts;

  /// No description provided for @totalNetworkStorage.
  ///
  /// In en, this message translates to:
  /// **'Total Network \nStorage'**
  String get totalNetworkStorage;

  /// No description provided for @totalUsedStorage.
  ///
  /// In en, this message translates to:
  /// **'Total Used \nStorage'**
  String get totalUsedStorage;

  /// No description provided for @pricePerTB.
  ///
  /// In en, this message translates to:
  /// **'Price per TB'**
  String get pricePerTB;

  /// No description provided for @pricePerTBPerMonth.
  ///
  /// In en, this message translates to:
  /// **'Price per \nTB/Month'**
  String get pricePerTBPerMonth;

  /// No description provided for @dailyActiveContracts.
  ///
  /// In en, this message translates to:
  /// **'Daily Active Contracts'**
  String get dailyActiveContracts;

  /// No description provided for @searchTitle.
  ///
  /// In en, this message translates to:
  /// **'Research a host'**
  String get searchTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Host public key'**
  String get searchHint;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter the host public key address'**
  String get searchLabel;

  /// No description provided for @hostInfo.
  ///
  /// In en, this message translates to:
  /// **'Host Informations'**
  String get hostInfo;

  /// No description provided for @myHostTitle.
  ///
  /// In en, this message translates to:
  /// **'My Host Overview'**
  String get myHostTitle;

  /// No description provided for @currentHostHeight.
  ///
  /// In en, this message translates to:
  /// **'Current Host Height'**
  String get currentHostHeight;

  /// No description provided for @maxDownloadPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Download Price'**
  String get maxDownloadPrice;

  /// No description provided for @maxUploadPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Upload Price'**
  String get maxUploadPrice;

  /// No description provided for @downloadSpeed.
  ///
  /// In en, this message translates to:
  /// **'Download Speed'**
  String get downloadSpeed;

  /// No description provided for @uploadSpeed.
  ///
  /// In en, this message translates to:
  /// **'Upload Speed'**
  String get uploadSpeed;

  /// No description provided for @maxStoragePrice.
  ///
  /// In en, this message translates to:
  /// **'Max Storage Price'**
  String get maxStoragePrice;

  /// No description provided for @maxContractsPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Contracts Price'**
  String get maxContractsPrice;

  /// No description provided for @minAccountExpiry.
  ///
  /// In en, this message translates to:
  /// **'Min Account Expiry'**
  String get minAccountExpiry;

  /// No description provided for @maxRPCPrice.
  ///
  /// In en, this message translates to:
  /// **'Max RPC Price'**
  String get maxRPCPrice;

  /// No description provided for @hostConfigTitle.
  ///
  /// In en, this message translates to:
  /// **'Host Configurations'**
  String get hostConfigTitle;

  /// No description provided for @configButton.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configButton;

  /// No description provided for @filesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Buckets'**
  String get filesTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @deleteNotifText.
  ///
  /// In en, this message translates to:
  /// **'You are about to delete this alert.'**
  String get deleteNotifText;

  /// No description provided for @deleteAllNotifText.
  ///
  /// In en, this message translates to:
  /// **'You are about to delete all alerts from Renterd.'**
  String get deleteAllNotifText;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorConnectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out.'**
  String get errorConnectionTimeout;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get errorNoInternet;

  /// No description provided for @errorReceiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout occurred.'**
  String get errorReceiveTimeout;

  /// No description provided for @errorSendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send timeout occurred.'**
  String get errorSendTimeout;

  /// No description provided for @errorInvalidCertificate.
  ///
  /// In en, this message translates to:
  /// **'Invalid certificate.'**
  String get errorInvalidCertificate;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access.'**
  String get errorUnauthorized;

  /// No description provided for @errorForbidden.
  ///
  /// In en, this message translates to:
  /// **'Access forbidden.'**
  String get errorForbidden;

  /// No description provided for @errorBadRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request.'**
  String get errorBadRequest;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Resource not found.'**
  String get errorNotFound;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict detected.'**
  String get errorConflict;

  /// No description provided for @errorBadManip.
  ///
  /// In en, this message translates to:
  /// **'Bad manipulation.'**
  String get errorBadManip;

  /// No description provided for @errorAccountDisabled.
  ///
  /// In en, this message translates to:
  /// **'Account is disabled.'**
  String get errorAccountDisabled;

  /// No description provided for @errorUnprocessableEntity.
  ///
  /// In en, this message translates to:
  /// **'Unprocessable entity.'**
  String get errorUnprocessableEntity;

  /// No description provided for @errorInternalServer.
  ///
  /// In en, this message translates to:
  /// **'Internal server error.'**
  String get errorInternalServer;

  /// No description provided for @errorProvider.
  ///
  /// In en, this message translates to:
  /// **'Provider error.'**
  String get errorProvider;

  /// No description provided for @errorOther.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get errorOther;

  /// No description provided for @errorBadMethod.
  ///
  /// In en, this message translates to:
  /// **'Bad method.'**
  String get errorBadMethod;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get errorUnknown;

  /// No description provided for @serverAddressField.
  ///
  /// In en, this message translates to:
  /// **'Renterd Public Address'**
  String get serverAddressField;

  /// No description provided for @serverAddressFieldHint.
  ///
  /// In en, this message translates to:
  /// **'IPV4 address'**
  String get serverAddressFieldHint;

  /// No description provided for @passwordField.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordField;

  /// No description provided for @emailField.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailField;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get loginButton;

  /// No description provided for @getStartedButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStartedButton;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Host Control'**
  String get onboardingTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Visualize data'**
  String get onboardingTitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Network data'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Easily take control of your host no matter where you are via our mobile application.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'View your host\'s status data in real time as well as all of its activity on the Sia network.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'You can visualize the state of the Sia network as well as all the exchanges of the hosts.'**
  String get onboardingDesc3;

  /// No description provided for @loginDesc.
  ///
  /// In en, this message translates to:
  /// **'To start interacting with the Sia network, please fill in the following fields.'**
  String get loginDesc;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get requiredField;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmail;

  /// No description provided for @invalidAddress.
  ///
  /// In en, this message translates to:
  /// **'Invalid server address.'**
  String get invalidAddress;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials.'**
  String get invalidCredentials;

  /// No description provided for @invalidAddressFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid address format.'**
  String get invalidAddressFormat;

  /// No description provided for @invalidForm.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields.'**
  String get invalidForm;

  /// No description provided for @cannotFindHostByKey.
  ///
  /// In en, this message translates to:
  /// **'Cannot find the host with this public key.'**
  String get cannotFindHostByKey;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
