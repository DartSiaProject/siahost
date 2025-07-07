import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/bucket_objects/bucket_object_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class ShareFileWidget extends StatelessWidget {
  const ShareFileWidget({required this.fileObject, super.key});

  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get())..shareFile(fileObject),
      child: _ShareFileView(fileObject),
    );
  }
}

class _ShareFileView extends StatelessWidget {
  const _ShareFileView(this.fileObject);
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileActionCubit, FileActionState>(
      listener: (context, state) {
        if (state is FileActionFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        } else if (state is FileActionSharedLinkCreated) {
          final shareLink = state.link;
          final newFileObject = fileObject.copyWith(
            shareLink: shareLink,
          );

          context
              .read<BucketObjectListCubit>()
              .updateFileObject(newFileObject, fileObject.key);
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
              context.l10n.generatingLink,
              style: context.textTheme.headlineMedium,
            ),

            // description
            Text(
              context.l10n.generatingProgress,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // button
            BlocBuilder<FileActionCubit, FileActionState>(
              builder: (context, state) {
                if (state is FileActionLoading) {
                  return const AppLoader();
                }

                if (state is FileActionFailure) {
                  return AppButton(
                    bgColor: Colors.red,
                    onPressed: () {
                      context.read<FileActionCubit>().shareFile(fileObject);
                    },
                    label: context.l10n.retry,
                  );
                }
                if (state is FileActionSharedLinkCreated) {
                  return AppButton(
                    onPressed: () {
                      context.maybePop(state.link);
                    },
                    label: context.l10n.shareLink,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
