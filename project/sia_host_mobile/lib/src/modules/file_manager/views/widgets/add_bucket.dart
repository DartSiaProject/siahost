import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_cubit.dart';
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_list_cubit.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class AddBucketWidget extends StatelessWidget {
  const AddBucketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BucketCubit(di.get()),
      child: const _AddBucketView(),
    );
  }
}

class _AddBucketView extends StatefulWidget {
  const _AddBucketView();

  @override
  State<_AddBucketView> createState() => _AddBucketViewState();
}

class _AddBucketViewState extends State<_AddBucketView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bucketNameController = TextEditingController();

  @override
  void dispose() {
    _bucketNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BucketCubit, BucketState>(
      listener: (context, state) {
        if (state is BucketFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
        if (state is BucketCreated) {
          AppSnackBar.success(
            message: context.l10n.bucketCreated,
          );
          context.read<BucketListCubit>().addBucket(state.bucket);
          context.maybePop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              AppInput(
                controller: _bucketNameController,
                labelText: context.l10n.bucketName,
                hintText: context.l10n.bucketNameHint,
                helperText: context.l10n.bucketNameRules,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: context.l10n.requiredField,
                  ),
                  FormBuilderValidators.match(
                    RegExp(bucketNamePattern),
                    errorText: context.l10n.invalidBucketNamePattern,
                  ),
                ]),
              ),
              BlocBuilder<BucketCubit, BucketState>(
                builder: (context, state) {
                  return AppButton(
                    isLoading: state is BucketLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState!.save();

                        context
                            .read<BucketCubit>()
                            .createBucket(_bucketNameController.text.trim());
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
