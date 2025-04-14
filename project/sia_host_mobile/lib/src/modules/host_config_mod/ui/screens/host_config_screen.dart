import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/string_const.dart';
import '../../../../shared/constants/svgs_const.dart';
import '../../../account_mod/features/user_login/domain/entities/user_login_entity.dart';
import '../../../account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';
import '../../../my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart';
import '../../features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart';
import '../../features/update_the_hoster_with_new_data/domain/entities/the_new_data_host_entity.dart';
import '../../features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart';
import '../widgets/fields_widget.dart';

@RoutePage()
class HostConfigScreen extends StatefulWidget {
  const HostConfigScreen({super.key});

  @override
  State<HostConfigScreen> createState() => _HostConfigScreenState();
}

class _HostConfigScreenState extends State<HostConfigScreen> {
  late TextEditingController _maxDownloadController;
  late TextEditingController _maxUploadController;
  late TextEditingController _maxStorageController;
  late TextEditingController _maxContractController;
  late TextEditingController _minAccountController;
  late TextEditingController _maxRpcController;
  late TextEditingController _adressController;
  late TextEditingController _userMailController;
  late TextEditingController _userPasswordController;
  late bool _passwordHidden;
  late bool _isLoginLoading;

  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _maxDownloadController = TextEditingController();
    _maxUploadController = TextEditingController();
    _maxStorageController = TextEditingController();
    _maxContractController = TextEditingController();
    _minAccountController = TextEditingController();
    _maxRpcController = TextEditingController();
    _adressController = TextEditingController();
    _userMailController = TextEditingController();
    _userPasswordController = TextEditingController();
    _passwordHidden = true;
    _isLoginLoading = false;

    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              Translator.of(context)!.translate(Lang.hostConfigText),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 28.0.sp,
                color: ColorsApp.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Expanded(
            child: BlocBuilder<FetchTheHosterForConfigBloc,
                FetchTheHosterForConfigState>(
              builder: (context, fetchTheHosterForConfigBuilderState) {
                if (fetchTheHosterForConfigBuilderState
                    is MakLoginForConfigPlease) {
                  return BlocConsumer<LoginAccountBloc, LoginAccountState>(
                    listener: (context, accountListenerState) {
                      if (accountListenerState is NewLoginSuccess) {
                        Fluttertoast.showToast(
                          msg: Translator.of(context)!
                              .translate(accountListenerState.message),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: ColorsApp.tunaColor,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        ).whenComplete(() {
                          context
                              .read<FetchTheHosterForConfigBloc>()
                              .add(FetchTheHostFromRenterdForConfigEvent());
                        });
                      }

                      if (accountListenerState is NewLoginFailed) {
                        Fluttertoast.showToast(
                          msg: Translator.of(context)!
                              .translate(accountListenerState.message),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: ColorsApp.tunaColor,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    builder: (context, accountBuilderState) {
                      if (accountBuilderState is PasswordHidded) {
                        _passwordHidden = accountBuilderState.passWordIsHided;
                      }
                      if (accountBuilderState is NewLoginLoading) {
                        _isLoginLoading = true;
                      } else {
                        _isLoginLoading = false;
                      }
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Translator.of(context)!.translate(
                                    fetchTheHosterForConfigBuilderState
                                        .message),
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0.sp,
                                  color: ColorsApp.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20.0.h,
                              ),
                              Flex(
                                direction: Axis.vertical,
                                children: <Widget>[
                                  Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          Translator.of(context)!
                                              .translate(Lang.adressPublicText),
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 16.0.sp,
                                            color: ColorsApp.whiteColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        controller: _adressController,
                                        decoration: InputDecoration(
                                          hintText: Translator.of(context)!
                                              .translate(Lang.adressText),
                                        ),
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                          color: ColorsApp.ironsideGreyColor,
                                          fontSize: 16.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          Translator.of(context)!
                                              .translate(Lang.yourEmailText),
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 16.0.sp,
                                            color: ColorsApp.whiteColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        controller: _userMailController,
                                        decoration: InputDecoration(
                                          hintText: Translator.of(context)!
                                              .translate(Lang.mailAdressText),
                                        ),
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                          color: ColorsApp.ironsideGreyColor,
                                          fontSize: 16.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          Translator.of(context)!.translate(
                                              Lang.yourPassrwordText),
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 16.0.sp,
                                            color: ColorsApp.whiteColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        obscureText: _passwordHidden,
                                        controller: _userPasswordController,
                                        decoration: InputDecoration(
                                          hintText: Translator.of(context)!
                                              .translate(Lang.passwordText),
                                          suffixIcon: IconButton(
                                            splashRadius: 23.0.r,
                                            onPressed: () {
                                              BlocProvider.of<LoginAccountBloc>(
                                                      context)
                                                  .add(HideThePassWordEvent(
                                                      hideThePassWord:
                                                          !_passwordHidden));
                                            },
                                            color: ColorsApp.whiteColor,
                                            icon: SvgPicture.asset(
                                              _passwordHidden
                                                  ? IconSvgs.eyeOnSvg
                                                  : IconSvgs.eyeOffSvg,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                          color: ColorsApp.ironsideGreyColor,
                                          fontSize: 16.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0.h,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 58.0.h,
                                    child: Material(
                                      color: ColorsApp.spearmintColor,
                                      borderRadius:
                                          BorderRadius.circular(12.0.r),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(12.0.r),
                                        onTap: () {
                                          if (_adressController.text.isEmpty ||
                                              _userMailController
                                                  .text.isEmpty ||
                                              _userPasswordController
                                                  .text.isEmpty) {
                                            Fluttertoast.showToast(
                                              msg: Translator.of(context)!
                                                  .translate(
                                                      Lang.fillFieldsText),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              backgroundColor:
                                                  ColorsApp.tunaColor,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          } else {
                                            BlocProvider.of<LoginAccountBloc>(
                                                    context)
                                                .add(MakeNewLoginEvent(
                                              userLoginEntity: UserLoginEntity(
                                                serverAddress:
                                                    _adressController.text,
                                                mailAdress:
                                                    _userMailController.text,
                                                passWord:
                                                    _userPasswordController
                                                        .text,
                                              ),
                                            ));
                                          }
                                        },
                                        child: Center(
                                          child: _isLoginLoading
                                              ? const CircularProgressIndicator(
                                                  color: ColorsApp.whiteColor,
                                                )
                                              : Text(
                                                  Translator.of(context)!
                                                      .translate(
                                                          "connect_text"),
                                                  style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 20.0.sp,
                                                    color: ColorsApp.whiteColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                if (fetchTheHosterForConfigBuilderState
                    is TheHostDataFetchedForConfigFailed) {
                  _maxDownloadController = TextEditingController();
                  _maxUploadController = TextEditingController();
                  _maxStorageController = TextEditingController();
                  _maxContractController = TextEditingController();
                  _minAccountController = TextEditingController();
                  _maxRpcController = TextEditingController();

                  return Center(
                    child: Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          Translator.of(context)!.translate(
                              fetchTheHosterForConfigBuilderState.message),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20.0.sp,
                            color: ColorsApp.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Material(
                          color: ColorsApp.spearmintColor,
                          borderRadius: BorderRadius.circular(12.0.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0.r),
                            onTap: () => context
                                .read<FetchTheHosterForConfigBloc>()
                                .add(FetchTheHostFromRenterdForConfigEvent()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Translator.of(context)!
                                    .translate(Lang.retryText),
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0.sp,
                                  color: ColorsApp.whiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (fetchTheHosterForConfigBuilderState
                    is TheHostDataFetchedForConfigSuccess) {
                  var _theHostDataEntity =
                      fetchTheHosterForConfigBuilderState.theHostDataEntity;

                  _maxDownloadController.text =
                      _theHostDataEntity.maxDownloadPrice.length > 2
                          ? _theHostDataEntity.maxDownloadPrice.substring(0, 3)
                          : _theHostDataEntity.maxDownloadPrice;

                  _maxUploadController.text =
                      _theHostDataEntity.maxUploadPrice.length > 2
                          ? _theHostDataEntity.maxUploadPrice.substring(0, 3)
                          : _theHostDataEntity.maxUploadPrice;

                  _maxStorageController.text =
                      _theHostDataEntity.maxStoragePrice.length > 2
                          ? _theHostDataEntity.maxStoragePrice.substring(0, 3)
                          : _theHostDataEntity.maxStoragePrice;

                  _maxContractController.text =
                      _theHostDataEntity.maxContractPrice.length > 2
                          ? _theHostDataEntity.maxContractPrice.substring(0, 3)
                          : _theHostDataEntity.maxContractPrice;

                  _minAccountController.text =
                      _theHostDataEntity.minAccountExpiry.length > 2
                          ? _theHostDataEntity.minAccountExpiry.substring(0, 3)
                          : _theHostDataEntity.minAccountExpiry;

                  _maxRpcController.text =
                      _theHostDataEntity.maxRPCPrice.length > 2
                          ? _theHostDataEntity.maxRPCPrice.substring(0, 3)
                          : _theHostDataEntity.maxRPCPrice;

                  return BlocConsumer<ReconfigTheHostDataBloc,
                      ReconfigTheHostDataState>(
                    listener: (context, reconfigTheHostDataListenerState) {
                      if (reconfigTheHostDataListenerState
                          is TheHostConfigSuccess) {
                        Fluttertoast.showToast(
                          msg: Translator.of(context)!.translate(
                              reconfigTheHostDataListenerState.message),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: ColorsApp.tunaColor,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        ).whenComplete(() {
                          context
                              .read<FetchMyHosterBloc>()
                              .add(FetchMyHostFromRenterdEvent());
                          context
                              .read<FetchTheHosterForConfigBloc>()
                              .add(FetchTheHostFromRenterdForConfigEvent());
                        });
                      }

                      if (reconfigTheHostDataListenerState
                          is TheHostConfigFailed) {
                        Fluttertoast.showToast(
                          msg: Translator.of(context)!.translate(
                              reconfigTheHostDataListenerState.message),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: ColorsApp.tunaColor,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    builder: (context, reconfigTheHostDataBuilderState) {
                      if (reconfigTheHostDataBuilderState
                          is TheHostConfigLoading) {
                        _isLoading = true;
                      } else {
                        _isLoading = false;
                      }
                      return SingleChildScrollView(
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
                                color: ColorsApp.spearmintColor,
                                borderRadius: BorderRadius.circular(12.0.r),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12.0.r),
                                  onTap: () {
                                    var _newHostDataEntity =
                                        TheNewDataHostEntity(
                                      maxContractPrice:
                                          "${_maxContractController.text}$zeroCompletion_1",
                                      maxDownloadPrice:
                                          "${_maxDownloadController.text}$zeroCompletion_1",
                                      maxStoragePrice:
                                          "${_maxStorageController.text}$zeroCompletion_1",
                                      maxUploadPrice:
                                          "${_maxUploadController.text}$zeroCompletion_1",
                                      maxRPCPrice:
                                          "${_maxRpcController.text}$zeroCompletion_1",
                                      minAccountExpiry:
                                          "${_minAccountController.text}$zeroCompletion_2",
                                      hostBlockHeightLeeway: _theHostDataEntity
                                          .hostBlockHeightLeeway,
                                      minMaxEphemeralAccountBalance:
                                          _theHostDataEntity
                                              .minMaxEphemeralAccountBalance,
                                      minPriceTableValidity: _theHostDataEntity
                                          .minPriceTableValidity,
                                    );

                                    context.read<ReconfigTheHostDataBloc>().add(
                                        UpdateTheHostFromRenterdEvent(
                                            theNewDataHostEntity:
                                                _newHostDataEntity));
                                  },
                                  child: Center(
                                    child: _isLoading
                                        ? const CircularProgressIndicator(
                                            color: ColorsApp.whiteColor,
                                          )
                                        : Text(
                                            Translator.of(context)!.translate(
                                                Lang.configButtonText),
                                            style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 20.0.sp,
                                              color: ColorsApp.whiteColor,
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
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsApp.spearmintColor,
                  ),
                );
              },
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
    _adressController.dispose();
    _userMailController.dispose();
    _userPasswordController.dispose();
  }
}
