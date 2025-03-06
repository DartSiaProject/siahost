import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/fetch_the_user_credentials/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart';

import '../../../../shared/constants/routes_const.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchUserCredentialBloc, FetchUserCredentialState>(
      listener: (context, fetchUserCredentialListenerState) {
        if (fetchUserCredentialListenerState is UserCredentialFetchedIsAbsent) {
          context.router.replaceNamed(RoutePath.onboardingPath);
        }
        if (fetchUserCredentialListenerState
            is UserCredentialFetchedIsPresent) {
          context.router.replaceNamed(RoutePath.siaMainPath);
        }
      },
      child: const Scaffold(),
    );
  }
}
