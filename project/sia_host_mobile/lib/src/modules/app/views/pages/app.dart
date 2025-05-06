import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/arb/app_localizations.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/app/logic/cubit/onboarding_cubit.dart';
import 'package:sia_host_mobile/src/modules/auth/logic/cubit/auth_cubit.dart';
import 'package:sia_host_mobile/src/modules/current_host/logic/cubit/current_host_cubit.dart';
import 'package:sia_host_mobile/src/modules/home/logic/cubit/network_overview_cubit.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => sl.get(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => sl.get(),
        ),
        BlocProvider<NetworkOverviewCubit>(
          create: (context) => sl.get()..getData(),
        ),
        BlocProvider<HostListBloc>(
          create: (context) => sl.get()..add(HostListFetchedEvent()),
        ),
        BlocProvider<CurrentHostCubit>(
          create: (context) => sl.get()..getData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: sl.get<AppRouter>().config(),
          builder: (context, child) => _unFocusWrapper(child),
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
