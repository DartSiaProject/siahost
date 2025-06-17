import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/preference/logic/cubit/language_cubit.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            context.l10n.chooseLanguage,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(context.l10n.english),
            onTap: () {
              context.read<LanguageCubit>().setLanguage(AppLocales.en);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(context.l10n.french),
            onTap: () {
              context.read<LanguageCubit>().setLanguage(AppLocales.fr);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
