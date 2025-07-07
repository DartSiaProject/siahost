import 'dart:io';

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

class CreateRestoreWidget extends StatelessWidget {
  const CreateRestoreWidget({
    required this.restoreFile,
    super.key,
  });
  final File restoreFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackupCubit(di.get()),
      child: _CreateRestoreView(restoreFile),
    );
  }
}

class _CreateRestoreView extends StatelessWidget {
  const _CreateRestoreView(this.restoreFile);
  final File restoreFile;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackupCubit, BackupState>(
      listener: (context, state) {
        if (state is BackupFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is BackupRestored) {
          AppSnackBar.success(
            message: context.l10n.dbRestoreSuccess,
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
              context.l10n.restoreTitle,
              style: context.textTheme.headlineMedium,
            ),

            // description
            Text(
              context.l10n.restoreUsingFile,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // button
            BlocBuilder<BackupCubit, BackupState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state is BackupLoading,
                  onPressed: () {
                    context.read<BackupCubit>().restore(restoreFile);
                  },
                  label: context.l10n.dbRestoreButton,
                );
              },
            ),

            // helper text
            BlocBuilder<BackupCubit, BackupState>(
              builder: (context, state) {
                if (state is BackupLoading) {
                  return Text(
                    context.l10n.waitingRestore,
                    style: context.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  );
                }

                return Text(
                  restoreFile.path.split('/').last,
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
