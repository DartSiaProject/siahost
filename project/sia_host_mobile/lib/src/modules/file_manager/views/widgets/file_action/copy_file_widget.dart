import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_list_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/file_actions/file_action_cubit.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class CopyFileWidget extends StatelessWidget {
  const CopyFileWidget({
    required this.fileObject,
    super.key,
  });
  final BucketObjectModel fileObject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileActionCubit(di.get()),
      child: _CopyFileView(fileObject),
    );
  }
}

class _CopyFileView extends StatefulWidget {
  const _CopyFileView(this.fileObject);
  final BucketObjectModel fileObject;

  @override
  State<_CopyFileView> createState() => _CopyFileViewState();
}

class _CopyFileViewState extends State<_CopyFileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _destfileNameController = TextEditingController();
  final TextEditingController _destBucketNameController =
      TextEditingController();

  @override
  void initState() {
    _destfileNameController.text = widget.fileObject.displayName;
    super.initState();
  }

  @override
  void dispose() {
    _destfileNameController.dispose();
    _destBucketNameController.dispose();
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
        if (state is FileActionCopied) {
          AppSnackBar.success(
            message: context.l10n.fileCopied(widget.fileObject.name),
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
                context.l10n.copyFile,
                style: context.textTheme.headlineMedium,
              ),

              // dest bucket
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    context.l10n.selectDestBucket,
                  ),
                  BlocBuilder<BucketListCubit, BucketListState>(
                    builder: (context, state) {
                      return DropdownButtonFormField<String>(
                        value: _destBucketNameController.text.isEmpty
                            ? null
                            : _destBucketNameController.text,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppTheme.inputColor,
                        ),
                        iconEnabledColor: AppTheme.boxBgColor,
                        iconDisabledColor:
                            AppTheme.inputColor.withValues(alpha: 0.5),
                        decoration: InputDecoration(
                          suffixIcon: state.status == StateStatus.loading
                              ? const CupertinoActivityIndicator()
                              : IconButton(
                                  onPressed: () {
                                    _destBucketNameController.text = '';
                                    context.read<BucketListCubit>().findAll();
                                  },
                                  icon: const Icon(Icons.refresh_rounded),
                                ),
                        ),
                        items: state.buckets
                            .where((v) => v.name != widget.fileObject.bucket)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.name,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) =>
                            _destBucketNameController.text = value ?? '',
                        validator: FormBuilderValidators.required(
                          errorText: context.l10n.requiredField,
                        ),
                      );
                    },
                  ),
                ],
              ),

              // new name input
              AppInput(
                controller: _destfileNameController,
                labelText: context.l10n.newFileNameField,
                hintText: context.l10n.newFileNameHint,
                helperText: context.l10n.newFileOrDefault,
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
                        final destBucketName =
                            _destBucketNameController.text.trim();

                        context.read<FileActionCubit>().copy(
                              widget.fileObject,
                              destBucketName: destBucketName,
                              destfileName: destfileName.isEmpty
                                  ? widget.fileObject.key
                                  : destfileName,
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
