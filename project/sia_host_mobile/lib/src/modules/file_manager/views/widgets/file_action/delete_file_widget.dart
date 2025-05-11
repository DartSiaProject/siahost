import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class DeleteFileWidget extends StatelessWidget {
  const DeleteFileWidget({
    required this.fileObject,
    super.key,
  });
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get()),
      child: _DeleteFileView(fileObject),
    );
  }
}

class _DeleteFileView extends StatelessWidget {
  const _DeleteFileView(this.fileObject);
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
        if (state is FileActionDeleted) {
          AppSnackBar.success(
            message: context.l10n.fileDeleted(fileObject.name),
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
            // delete title
            Text(
              context.l10n.deleteFileNotice,
              style: context.textTheme.headlineMedium,
            ),

            // delete description
            Text(
              context.l10n.deleteFileDesc,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // button uploader
            BlocBuilder<FileActionCubit, FileActionState>(
              builder: (context, state) {
                return AppButton(
                  bgColor: Colors.red,
                  isLoading: state is FileActionLoading,
                  onPressed: () {
                    context.read<FileActionCubit>().remove(fileObject);
                  },
                  label: context.l10n.delete,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
