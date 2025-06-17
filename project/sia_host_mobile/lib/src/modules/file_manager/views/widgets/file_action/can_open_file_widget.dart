import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class CanOpenFileWidget extends StatelessWidget {
  const CanOpenFileWidget({
    required this.fileObject,
    super.key,
  });
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get())..canOpenFile(fileObject),
      child: _CanOpenFileView(fileObject),
    );
  }
}

class _CanOpenFileView extends StatelessWidget {
  const _CanOpenFileView(this.fileObject);
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileActionCubit, FileActionState>(
      listener: (context, state) {
        if (state is FileActionFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is FileActionOpening) {
          final filePath = state.filePath;
          if (filePath == null) {
            context.maybePop(OpeningFileStatus.canNotOpen);
            return;
          }

          if (!state.isSupported) {
            AppSnackBar.warning(
              message: context.l10n.unsupportedFileNotice,
            );
            return;
          }

          context.maybePop(OpeningFileStatus.canOpen);
        }
      },
      child: BlocBuilder<FileActionCubit, FileActionState>(
        builder: (context, state) {
          if (state is FileActionOpening && !state.isSupported) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  // unsupported title
                  Text(
                    context.l10n.unsupportedFileNotice,
                    style: context.textTheme.headlineMedium,
                  ),

                  // ask to open externally
                  Text(
                    context.l10n.unsupportedFileDesc,
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),

                  // button external
                  AppButton(
                    onPressed: () {
                      AppSnackBar.info(
                        message: context.l10n.wait,
                      );
                      context.maybePop().then(
                        (_) async {
                          await OpenFilex.open(state.filePath!);
                        },
                      );
                    },
                    label: context.l10n.unsupportedOpenExternally,
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
