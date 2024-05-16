import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/configs/device_config/device_size.dart';
import 'src/core/configs/injectors_config/injector.dart';
import 'src/core/configs/language_config/translations_delegate.dart';
import 'src/core/init.dart';
import 'src/core/router/auto_routes.dart';
import 'src/core/themes/dark_theme.dart';
import 'src/modules/account_mod/features/fetch_user_account_present/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart';
import 'src/modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';
import 'src/modules/home_mod/features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart';
import 'src/modules/host_config_mod/features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart';
import 'src/modules/host_config_mod/features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart';
import 'src/modules/my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart';
import 'src/modules/search_mod/features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart';
import 'src/modules/search_mod/features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart';
import 'src/shared/constants/string_const.dart';

void main() async {
  await Init.launch();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<LoginAccountBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<FetchUserCredentialBloc>()
          ..add(FetchUserCredentialFromCacheEvent()),
      ),
      BlocProvider(
        create: (context) =>
            sl<NetworkDataFetchingBloc>()..add(FetchNetworkDataEvent()),
      ),
      BlocProvider(
        create: (context) =>
            sl<FetchAllHostsDataBloc>()..add(FetchAllHostsDataListEvent()),
      ),
      BlocProvider(
        create: (context) => sl<FetchOneHostDataAndShowItBloc>(),
      ),
      BlocProvider(
        create: (context) =>
            sl<FetchMyHosterBloc>()..add(FetchMyHostFromRenterdEvent()),
      ),
      BlocProvider(
        create: (context) => sl<FetchTheHosterForConfigBloc>()
          ..add(FetchTheHostFromRenterdForConfigEvent()),
      ),
      BlocProvider(
        create: (context) => sl<ReconfigTheHostDataBloc>(),
      ),
    ],
    child: SiaHostMobile(),
  ));
}

class SiaHostMobile extends StatelessWidget {
  final _autoRoutes = AutoRoutes();
  SiaHostMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DeviceSize.fetchScreenSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: _autoRoutes.config(),
        debugShowCheckedModeBanner: false,
        title: app,
        theme: DarkTheme.dark,
        localizationsDelegates: const [
          TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fr", 'FR'),
          Locale("en", "US"),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
