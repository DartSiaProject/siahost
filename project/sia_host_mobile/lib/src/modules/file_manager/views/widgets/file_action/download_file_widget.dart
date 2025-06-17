import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/download_file_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class DownloadFileWidget extends StatelessWidget {
  const DownloadFileWidget({
    required this.fileObject,
    super.key,
  });
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadFileCubit(di.get(), di.get()),
      child: _DeleteFileView(fileObject),
    );
  }
}

class _DeleteFileView extends StatelessWidget {
  const _DeleteFileView(this.fileObject);
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadFileCubit, DownloadFileState>(
      listener: (context, state) {
        if (state is DownloadFileFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
          return;
        }

        if (state is DownloadFileInProgress) {
          AppSnackBar.error(
            message: context.l10n.downloadAlreadyInProgress,
          );
          context.maybePop(true);
          return;
        }

        if (state is DownloadFileStarted) {
          AppSnackBar.success(
            message: context.l10n.downloadStart,
          );
          context.maybePop(true);
          return;
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            // delete title
            Text(
              context.l10n.downloadFile,
              style: context.textTheme.headlineMedium,
            ),

            // delete description
            Text(
              context.l10n.downloadFileNotice,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // button downloader
            BlocBuilder<DownloadFileCubit, DownloadFileState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state is DownloadFileLoading,
                  onPressed: () {
                    context.read<DownloadFileCubit>().downloadFile(fileObject);
                  },
                  label: context.l10n.downloadAction,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
