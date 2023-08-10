import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/logic/controllers/hoster_bloc/hoster_bloc.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/host_widgets/fields_widget.dart';

class HostConfigFragment extends StatefulWidget {
  const HostConfigFragment({super.key});

  @override
  State<HostConfigFragment> createState() => _HostConfigFragmentState();
}

class _HostConfigFragmentState extends State<HostConfigFragment> {
  late TextEditingController _maxDownloadController;
  late TextEditingController _maxUploadController;
  late TextEditingController _maxStorageController;
  late TextEditingController _maxContractController;
  late TextEditingController _minAccountController;
  late TextEditingController _maxRpcController;

  @override
  void initState() {
    super.initState();
    _maxDownloadController = TextEditingController();
    _maxUploadController = TextEditingController();
    _maxStorageController = TextEditingController();
    _maxContractController = TextEditingController();
    _minAccountController = TextEditingController();
    _maxRpcController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HosterBloc, HosterState>(
      listener: (context, hosterListenerState) {
        if (hosterListenerState is MyHostConfigSuccess) {
          Fluttertoast.showToast(
            msg: LanguageTranslationHelper.of(context)!
                .translate(hosterListenerState.message),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: color.tunaColor,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, hosterBuilderState) {
        if (hosterBuilderState is MyHostDataGetSuccess) {
          var _hostSetting = hosterBuilderState.hostSetting;

          _maxDownloadController.text =
              _hostSetting.maxDownloadPrice.substring(0, 3);
          _maxUploadController.text =
              _hostSetting.maxUploadPrice.substring(0, 3);
          _maxStorageController.text =
              _hostSetting.maxStoragePrice.substring(0, 3);
          _maxContractController.text =
              _hostSetting.maxContractPrice.substring(0, 3);
          _minAccountController.text =
              _hostSetting.minAccountExpiry.toString().substring(0, 3);
          _maxRpcController.text = _hostSetting.maxRPCPrice.substring(0, 3);
        }

        if (hosterBuilderState is MyHostDataGetFailed) {
          _maxDownloadController = TextEditingController();
          _maxUploadController = TextEditingController();
          _maxStorageController = TextEditingController();
          _maxContractController = TextEditingController();
          _minAccountController = TextEditingController();
          _maxRpcController = TextEditingController();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  LanguageTranslationHelper.of(context)!
                      .translate("host_config_text"),
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontSize: 28.0.sp,
                    color: color.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      FieldsWidget(
                        maxDownloadController: _maxDownloadController,
                        maxUploadController: _maxUploadController,
                        maxStorageController: _maxStorageController,
                        maxContractController: _maxContractController,
                        minAccountController: _minAccountController,
                        maxRpcController: _maxRpcController,
                      ),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      SizedBox(
                        width: 327.0.w,
                        height: 56.0.h,
                        child: Material(
                          color: color.spearmintColor,
                          borderRadius: BorderRadius.circular(12.0.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0.r),
                            onTap: () {
                              BlocProvider.of<HosterBloc>(context).add(
                                UpdateMyHostFromRenterdEvent(
                                  hostSetting: HostSetting(
                                    maxContractPrice:
                                        _maxContractController.text,
                                    maxDownloadPrice:
                                        _maxDownloadController.text,
                                    maxStoragePrice: _maxStorageController.text,
                                    maxUploadPrice: _maxUploadController.text,
                                    maxRPCPrice: _maxRpcController.text,
                                    minAccountExpiry:
                                        _minAccountController.text,
                                  ),
                                ),
                              );
                            },
                            child: Center(
                              child: hosterBuilderState is MyHostConfigLoading
                                  ? const CircularProgressIndicator(
                                      color: color.whiteColor,
                                    )
                                  : Text(
                                      LanguageTranslationHelper.of(context)!
                                          .translate("config_button_text"),
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20.0.sp,
                                        color: color.whiteColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _maxDownloadController.dispose();
    _maxUploadController.dispose();
    _maxStorageController.dispose();
    _maxContractController.dispose();
    _minAccountController.dispose();
    _maxRpcController.dispose();
  }
}
