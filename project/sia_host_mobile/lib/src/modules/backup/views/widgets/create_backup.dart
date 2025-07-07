import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/backup/logic/cubit/backup_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class CreateBackupWidget extends StatelessWidget {
  const CreateBackupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackupCubit(di.get()),
      child: const _CreateBackupView(),
    );
  }
}

class _CreateBackupView extends StatelessWidget {
  const _CreateBackupView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackupCubit, BackupState>(
      listener: (context, state) {
        if (state is BackupFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is BackupSaved) {
          AppSnackBar.success(
            message: context.l10n.dbBackupSuccess,
          );
          context.maybePop(true);
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            // title
            Text(
              context.l10n.backupTitle,
              style: context.textTheme.headlineMedium,
            ),

            // description
            Text(
              context.l10n.dbBackupDesc,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // button
            BlocBuilder<BackupCubit, BackupState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state is BackupLoading,
                  onPressed: () {
                    context.read<BackupCubit>().backup();
                  },
                  label: context.l10n.dbBackupButton,
                );
              },
            ),

            // helper text

            BlocBuilder<BackupCubit, BackupState>(
              builder: (context, state) {
                if (state is! BackupLoading) {
                  return const SizedBox.shrink();
                }

                return Text(
                  context.l10n.waitingBackup,
                  style: context.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
