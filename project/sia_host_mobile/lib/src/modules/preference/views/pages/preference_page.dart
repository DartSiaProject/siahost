import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/preference/views/widgets/language_switcher.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_bottom_sheet.dart';

@RoutePage()
class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PreferenceView();
  }
}

class PreferenceView extends StatelessWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: BackButton(
              onPressed: () {
                context.maybePop();
              },
            ),
            title: Text(
              context.l10n.preferences,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // language
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.language_rounded),
              title: Text(context.l10n.changeLanguage),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                // context.router.push(const LanguageRoute());
                AppBottomSheet.show(context, child: const LanguageSwitcher());
              },
            ),
          ),
        ],
      ),
    );
  }
}
