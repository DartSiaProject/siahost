import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/injection.dart' as insert;
import 'src/logic/controllers/account_bloc/account_bloc.dart';
import 'src/logic/controllers/bloc_observer.dart';
import 'src/logic/controllers/sia_bloc/sia_bloc.dart';
import 'src/utils/constants/string_const.dart';
import 'src/utils/enums/themes_enum.dart';
import 'src/utils/helpers/device_helpers/size_config_helper.dart';
import 'src/utils/helpers/language_helpers/translations_delegate_helper.dart';
import 'src/utils/routes/go_routers.dart';
import 'src/utils/themes/themes_app.dart';

void main() async {
  await insert.init();

  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => insert.sl<AccountBloc>(),
        ),
        BlocProvider(
          create: (context) => insert.sl<SiaBloc>(),
        )
      ],
      child: const SiaHostsMobile(),
    ),
  );
}

class SiaHostsMobile extends StatelessWidget {
  const SiaHostsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SizeConfigHelper.sizeScreen(context),
      builder: (BuildContext context, AsyncSnapshot<Size> sizeSnapshot) {
        return ScreenUtilInit(
          designSize: sizeSnapshot.data ?? ScreenUtil.defaultSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            routerConfig: GoRouters.router,
            debugShowCheckedModeBanner: false,
            title: titleApp,
            theme: ThemesApp.themes[Themes.lightTheme],
            localizationsDelegates: const [
              TranslationsDelegateHelper(),
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
      },
    );
  }
}