// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/backup/logic/cubit/backup_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/backup/views/widgets/backup_file_card.dart';
import 'package:sia_host_mobile/src/modules/backup/views/widgets/create_backup.dart';
import 'package:sia_host_mobile/src/modules/backup/views/widgets/create_restore.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_bottom_sheet.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/empty_list_widget.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () => context.read<BackupListCubit>().findAll(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              leading: BackButton(
                onPressed: () {
                  context.maybePop();
                },
              ),
              title: Text(
                context.l10n.dbBackup,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              // action allowing user to restore by picking a file
              actions: [
                PopupMenuButton<int>(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 0,
                        onTap: () {
                          _onPickingExternalBackup(context);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.restore),
                            const SizedBox(width: 8),
                            Text(context.l10n.restoreVia),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: _BackupView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onCreateBackup(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Show the create backup dialog
  ///
  Future<void> _onCreateBackup(BuildContext context) async {
    final result = await AppBottomSheet.show<bool>(
      context,
      child: const CreateBackupWidget(),
    );

    if (result ?? false) {
      unawaited(context.read<BackupListCubit>().findAll());
    }
  }

  /// Show the restore dialog
  ///
  Future<void> _onPickingExternalBackup(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final xFile = result.files.first;

      // if file is not .bak, show error
      if (xFile.extension != 'bak') {
        unawaited(
          AppSnackBar.warning(
            message: context.l10n.chooseRealBackup,
          ),
        );
        return;
      }

      final file = File(result.files.first.path!);

      // show the restore dialog
      final restoreFile = await AppBottomSheet.show<bool>(
        context,
        child: CreateRestoreWidget(restoreFile: file),
      );

      if (restoreFile ?? false) {
        unawaited(context.read<BackupListCubit>().findAll());
      }
    }
  }
}

class _BackupView extends StatelessWidget {
  const _BackupView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackupListCubit, BackupListState>(
      builder: (context, state) {
        final status = state.status;

        if (status == StateStatus.loading) {
          return const SliverFillRemaining(child: AppLoader());
        } else if (status == StateStatus.failure) {
          return SliverFillRemaining(
            child: AppErrorWidget(
              message: translateErrorMessage(context, state.error!),
              onRefresh: () => context.read<BackupListCubit>().findAll(),
            ),
          );
        } else if (state.backups.isEmpty) {
          return SliverFillRemaining(
            child: EmptyListWidget(
              message: context.l10n.noBackupsFound,
            ),
          );
        }

        return SliverList.separated(
          itemCount: state.backups.length,
          itemBuilder: (context, index) {
            final backup = state.backups[index];

            return BackupFileCard(
              file: backup,
              onRestore: () {
                _onRestore(context, backup);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
    );
  }

  /// Show the restore dialog
  ///
  Future<void> _onRestore(BuildContext context, File file) async {
    final result = await AppBottomSheet.show<bool>(
      context,
      child: CreateRestoreWidget(restoreFile: file),
    );

    if (result ?? false) {
      unawaited(context.read<BackupListCubit>().findAll());
    }
  }
}
