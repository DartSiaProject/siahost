import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/views/widgets/file_picker_container.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class UploadFileWidget extends StatelessWidget {
  const UploadFileWidget({
    required this.bucketName,
    super.key,
  });
  final String bucketName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get()),
      child: _UploadFileView(bucketName),
    );
  }
}

class _UploadFileView extends StatefulWidget {
  const _UploadFileView(this.bucketName);
  final String bucketName;

  @override
  State<_UploadFileView> createState() => _UploadFileViewState();
}

class _UploadFileViewState extends State<_UploadFileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fileNameController = TextEditingController();

  PlatformFile? _pickedFile;

  @override
  void dispose() {
    _fileNameController.dispose();
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
          return;
        }
        if (state is FileActionUploaded) {
          AppSnackBar.success(
            message: context.l10n.fileUploaded(state.name),
          );
          context.maybePop(true);
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
                context.l10n.uploadFile,
                style: context.textTheme.headlineMedium,
              ),

              // file picker
              FilePickerContainer(
                onFilePicked: (file) {
                  _pickedFile = file;
                },
              ),

              // name input
              AppInput(
                controller: _fileNameController,
                labelText: context.l10n.uploadFormNameField,
                hintText: context.l10n.newFileNameHint,
                helperText: context.l10n.newFileOrDefault,
              ),

              // button uploader
              BlocBuilder<FileActionCubit, FileActionState>(
                builder: (context, state) {
                  var progressPercentage = 0;

                  if (state is FileActionUploadProgress) {
                    progressPercentage = state.percentage;
                  }
                  return AppButton(
                    isProgressing: state is FileActionUploadProgress,
                    progressPercentage: progressPercentage,
                    isLoading: state is FileActionLoading,
                    onPressed: () {
                      if (_pickedFile == null) return;

                      final file = File(_pickedFile!.path!);

                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState!.save();

                        var fileName = _fileNameController.text.trim();

                        if (fileName.isNotEmpty) {
                          final extension =
                              file.path.split('.').lastOrNull ?? '';
                          fileName += extension.isNotEmpty ? '.$extension' : '';
                        } else {
                          fileName = _pickedFile!.name;
                        }

                        context.read<FileActionCubit>().upload(
                              file,
                              bucketName: widget.bucketName,
                              fileName: fileName,
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
