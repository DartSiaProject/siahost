import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/backup/logic/cubit/backup_cubit.dart';
import 'package:sia_host_mobile/src/modules/backup/logic/cubit/backup_list_cubit.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class BackupFileCard extends StatelessWidget {
  const BackupFileCard({
    required this.file,
    required this.onRestore,
    super.key,
  });

  final File file;
  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackupCubit(di.get()),
      child: _BackupFileCardView(file, onRestore),
    );
  }
}

class _BackupFileCardView extends StatelessWidget {
  const _BackupFileCardView(this.file, this.onRestore);

  final File file;
  final VoidCallback onRestore;

  String get fileName => file.path.split('/').last;

  String fileSize(BuildContext context) {
    final size = file.lengthSync();
    if (size < 1024) {
      return '$size ${context.l10n.byte}';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(2)} ${context.l10n.kiloByte}';
    } else if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} ${context.l10n.megaByte}';
    } else {
      return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} ${context.l10n.gigaByte}';
    }
  }

  String fileDate(BuildContext context) {
    final date = file.lastModifiedSync();
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BackupCubit, BackupState>(
      listener: (context, state) {
        if (state is BackupFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is BackupDeleted) {
          context.read<BackupListCubit>().remove(file);
        }
      },
      listenWhen: (previous, current) => current is BackupFailure,
      child: ListTile(
        onTap: onRestore,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.file_present_rounded),
        title: Text(
          fileName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${fileSize(context)} - ${fileDate(context)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: BlocBuilder<BackupCubit, BackupState>(
          builder: (context, state) {
            if (state is BackupLoading) {
              return const CupertinoActivityIndicator();
            }
            return IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<BackupCubit>().remove(file);
              },
            );
          },
        ),
      ),
    );
  }
}
