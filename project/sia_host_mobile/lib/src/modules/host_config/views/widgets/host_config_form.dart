import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/current_host/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/host_config/data/models/dto/host_config_dto.dart';
import 'package:sia_host_mobile/src/modules/host_config/logic/cubit/host_config_cubit.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_input.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';

class HostConfigForm extends StatefulWidget {
  const HostConfigForm({required this.hostInfo, super.key});
  final CurrentHostInfoModel hostInfo;

  @override
  State<HostConfigForm> createState() => _HostConfigFormState();
}

class _HostConfigFormState extends State<HostConfigForm> {
  final _formKey = GlobalKey<FormState>();

  // text controllers
  late TextEditingController _maxDownloadController;
  late TextEditingController _maxUploadController;
  late TextEditingController _maxStorageController;
  late TextEditingController _maxContractController;
  late TextEditingController _minAccountController;
  late TextEditingController _maxRpcController;

  @override
  void initState() {
    super.initState();

    final hostInfo = widget.hostInfo;
    _initTextControllers(hostInfo);
  }

  /// Initializes the text controllers with the host info values
  void _initTextControllers(CurrentHostInfoModel hostInfo) {
    _maxDownloadController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxDownloadPrice,
        divideBy: 100000000000000000,
      ).toString(),
    );
    _maxUploadController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxUploadPrice,
        divideBy: 100000000000000000,
      ).toString(),
    );
    _maxStorageController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxStoragePrice,
        divideBy: 100000000000000000, //1e17
      ).toString(),
    );
    _maxContractController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxContractPrice,
        divideBy: 100000000000000000, // 1e17
      ).toString(),
    );
    _minAccountController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxContractPrice,
        divideBy: 10000000000000000, // 1e16
      ).toString(),
    );
    _maxRpcController = TextEditingController(
      text: HostHelper.convertPricing(
        hostInfo.maxRPCPrice,
        divideBy: 100000000000000000, // 1e17
      ).toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<HostConfigCubit, HostConfigState>(
      listener: (context, state) {
        if (state is HostConfigSuccess) {
          AppSnackBar.success(message: context.l10n.hostConfigSuccess);
          return;
        }

        if (state is HostConfigFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
          return;
        }
      },
      listenWhen: (previous, current) =>
          current is HostConfigFailure || current is HostConfigSuccess,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              // max download
              AppInput(
                controller: _maxDownloadController,
                labelText: l10n.maxDownloadPrice,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // max upload
              AppInput(
                controller: _maxUploadController,
                labelText: l10n.maxUploadPrice,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // max storage
              AppInput(
                controller: _maxStorageController,
                labelText: l10n.maxStoragePrice,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // max contract
              AppInput(
                controller: _maxContractController,
                labelText: l10n.maxContractsPrice,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // min account expiry
              AppInput(
                controller: _minAccountController,
                labelText: l10n.minAccountExpiry,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // max RPC
              AppInput(
                controller: _maxRpcController,
                labelText: l10n.maxRPCPrice,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),

              // save button
              BlocBuilder<HostConfigCubit, HostConfigState>(
                builder: (context, state) {
                  return AppButton(
                    isCentered: true,
                    onPressed: () {
                      _proceedUpdate(context);
                    },
                    label: l10n.configButton,
                    isLoading: state is HostConfigLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _proceedUpdate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final dto = HostConfigDto(
        maxStoragePrice: HostHelper.revertPricingConvertion(
          _maxStorageController.text,
          multiplyBy: 100000000000000000, // 1e17
        ).toString(),
        maxDownloadPrice: HostHelper.revertPricingConvertion(
          _maxDownloadController.text,
          multiplyBy: 100000000000000000, // 1e17
        ).toString(),
        maxUploadPrice: HostHelper.revertPricingConvertion(
          _maxUploadController.text,
          multiplyBy: 100000000000000000, // 1e17
        ).toString(),
        maxContractPrice: HostHelper.revertPricingConvertion(
          _maxContractController.text,
          multiplyBy: 100000000000000000, // 1e17
        ).toString(),
        maxRPCPrice: HostHelper.revertPricingConvertion(
          _maxRpcController.text,
          multiplyBy: 100000000000000000, // 1e17
        ).toString(),
        minAccountExpiry: HostHelper.revertPricingConvertion(
          _maxRpcController.text,
          multiplyBy: 10000000000000000, // 1e16
        ).toString(),
        hostBlockHeightLeeway: widget.hostInfo.hostBlockHeightLeeway,
        minMaxEphemeralAccountBalance:
            widget.hostInfo.minMaxEphemeralAccountBalance,
        minPriceTableValidity: widget.hostInfo.minPriceTableValidity,
      );

      context.read<HostConfigCubit>().updateHost(dto);
    } else {
      AppSnackBar.warning(message: context.l10n.invalidForm);
    }
  }
}
