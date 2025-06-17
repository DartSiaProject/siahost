import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class RenameFileWidget extends StatelessWidget {
  const RenameFileWidget({
    required this.fileObject,
    super.key,
  });
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get()),
      child: _RenameFileView(fileObject),
    );
  }
}

class _RenameFileView extends StatefulWidget {
  const _RenameFileView(this.fileObject);
  final BucketObjectModel fileObject;

  @override
  State<_RenameFileView> createState() => _RenameFileViewState();
}

class _RenameFileViewState extends State<_RenameFileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _destfileNameController = TextEditingController();

  @override
  void initState() {
    _destfileNameController.text = widget.fileObject.displayName;
    super.initState();
  }

  @override
  void dispose() {
    _destfileNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FileActionCubit, FileActionState>(
      listener: (context, state) {
        if (state is FileActionFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is FileActionRenamed) {
          AppSnackBar.success(
            message: context.l10n.fileCopied(widget.fileObject.name),
          );
          context.maybePop(state.name);
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              // title
              Text(
                context.l10n.renameFile,
                style: context.textTheme.headlineMedium,
              ),

              // new name input
              AppInput(
                controller: _destfileNameController,
                labelText: context.l10n.newFileNameField,
                hintText: context.l10n.newFileNameHint,
              ),

              // button uploader
              BlocBuilder<FileActionCubit, FileActionState>(
                builder: (context, state) {
                  return AppButton(
                    isLoading: state is FileActionLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState!.save();
                        final destfileName =
                            _destfileNameController.text.trim();

                        if (destfileName == widget.fileObject.displayName) {
                          AppSnackBar.warning(
                            message: context.l10n.chooseDifferentName,
                          );
                          return;
                        }

                        context.read<FileActionCubit>().rename(
                              widget.fileObject,
                              newFileName: destfileName,
                            );
                      }
                    },
                    label: context.l10n.save,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
