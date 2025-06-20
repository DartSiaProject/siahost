import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/arb/app_localizations.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/app/logic/cubit/onboarding_cubit.dart';
import 'package:sia_host_mobile/src/modules/auth/logic/cubit/auth_cubit.dart';
import 'package:sia_host_mobile/src/modules/current_host/logic/cubit/current_host_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/home/logic/cubit/network_overview_cubit.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart';
import 'package:sia_host_mobile/src/modules/notifications/logic/bloc/notification_bloc.dart';
import 'package:sia_host_mobile/src/modules/preference/logic/cubit/language_cubit.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => di.get(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => di.get(),
        ),
        BlocProvider<NetworkOverviewCubit>(
          create: (context) => di.get()..getData(),
        ),
        BlocProvider<HostListBloc>(
          create: (context) => di.get()..add(HostListFetchedEvent()),
        ),
        BlocProvider<CurrentHostCubit>(
          create: (context) => di.get()..getData(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => di.get()..add(const NotificationFetchedEvent()),
        ),
        BlocProvider<BucketListCubit>(
          create: (context) => di.get()..findAll(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => di.get()..getCurrentLanguage(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          buildWhen: (previous, current) =>
              previous != current && current is LanguageSuccess,
          builder: (context, state) {
            Locale? locale;
            if (state is LanguageSuccess) {
              locale = state.locale;
            }

            return MaterialApp.router(
              locale: locale,
              scrollBehavior: CustomScrollBehavior(),
              scaffoldMessengerKey: scaffoldMessengerKey,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: di.get<AppRouter>().config(),
              builder: (context, child) => _unFocusWrapper(child),
              localeResolutionCallback: (locale, supportedLocales) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _unFocusWrapper(Widget? child) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: child,
  );
}
