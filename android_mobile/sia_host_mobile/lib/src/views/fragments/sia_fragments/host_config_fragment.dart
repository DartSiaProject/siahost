import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/utils/helpers/language_helpers/language_translation_helper.dart';
import 'package:sia_host_mobile/src/views/widgets/host_widgets/fields_widget.dart';

import '../../../utils/constants/colors_const.dart' as color;

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
                          // GoRouter.of(context).push(route.siaScreen);

                          //! .pushReplacement(route.siaScreen);
                          // todo : remplacer après
                        },
                        child: Center(
                          child: Text(
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
