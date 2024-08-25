import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/svgs_const.dart';
import '../../../account_mod/features/user_login/domain/entities/user_login_entity.dart';
import '../../../account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';
import '../../features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart';
import '../widgets/card_my_host_info_widget.dart';
import '../widgets/card_speed_widget.dart';

@RoutePage()
class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  late TextEditingController _adressController;
  late TextEditingController _userMailController;
  late TextEditingController _userPasswordController;
  late bool _passwordHidden;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _adressController = TextEditingController();
    _userMailController = TextEditingController();
    _userPasswordController = TextEditingController();
    _passwordHidden = true;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Translator.of(context)!.translate(Lang.myHostText),
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
          child: BlocBuilder<FetchMyHosterBloc, FetchMyHosterState>(
            builder: (context, hosterBuilderState) {
              if (hosterBuilderState is MakLoginPlease) {
                return Center(
                  child: BlocConsumer<LoginAccountBloc, LoginAccountState>(
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
                              .read<FetchMyHosterBloc>()
                              .add(FetchMyHostFromRenterdEvent());
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
                        _isLoading = true;
                      } else {
                        _isLoading = false;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            Translator.of(context)!
                                .translate(hosterBuilderState.message),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      Translator.of(context)!
                                          .translate(Lang.yourPassrwordText),
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
                                  borderRadius: BorderRadius.circular(12.0.r),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12.0.r),
                                    onTap: () {
                                      if (_adressController.text.isEmpty ||
                                          _userMailController.text.isEmpty ||
                                          _userPasswordController
                                              .text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: Translator.of(context)!
                                              .translate(Lang.fillFieldsText),
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.TOP,
                                          backgroundColor: ColorsApp.tunaColor,
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
                                                _userPasswordController.text,
                                          ),
                                        ));
                                      }
                                    },
                                    child: Center(
                                      child: _isLoading
                                          ? const CircularProgressIndicator(
                                              color: ColorsApp.whiteColor,
                                            )
                                          : Text(
                                              Translator.of(context)!
                                                  .translate("connect_text"),
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
                      );
                    },
                  ),
                );
              }

              if (hosterBuilderState is MyHostDataGetFailed) {
                return Center(
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        Translator.of(context)!
                            .translate(hosterBuilderState.message),
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
                              .read<FetchMyHosterBloc>()
                              .add(FetchMyHostFromRenterdEvent()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Translator.of(context)!.translate(Lang.retryText),
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

              if (hosterBuilderState is MyHostDataGetSuccess) {
                var _myHostDataEntity = hosterBuilderState.myHostDataEntity;

                return RefreshIndicator(
                  color: ColorsApp.spearmintColor,
                  backgroundColor: ColorsApp.bleachedCedarColor,
                  onRefresh: () async => context
                      .read<FetchMyHosterBloc>()
                      .add(FetchMyHostFromRenterdEvent()),
                  child: SingleChildScrollView(
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 0.56,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsApp.tunaColor,
                                  borderRadius: BorderRadius.circular(12.0.r),
                                ),
                                padding: EdgeInsets.all(15.0.r),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: ColorsApp.spearmintColor,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        Translator.of(context)!
                                            .translate(Lang.serverHostText),
                                        style: TextStyle(
                                          fontFamily: "Manrope",
                                          fontSize: 12.0.sp,
                                          color: ColorsApp.cottonSeedColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.0.h,
                                      ),
                                      Text(
                                        _myHostDataEntity.blockHeight.isEmpty
                                            ? ""
                                            : _myHostDataEntity.blockHeight
                                                .substring(0, 3),
                                        style: TextStyle(
                                          fontFamily: "Manrope",
                                          fontSize: 24.0.sp,
                                          color: ColorsApp.whiteColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flex(
                                direction: Axis.vertical,
                                children: <Widget>[
                                  CardMyHostInfoWidget(
                                    title: Lang.maxDownloadText,
                                    value: _myHostDataEntity.maxDownloadPrice,
                                    padding: const EdgeInsets.only(left: 10.0),
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  CardMyHostInfoWidget(
                                    title: Lang.maxUploadText,
                                    value: _myHostDataEntity.maxUploadPrice,
                                    padding: const EdgeInsets.only(left: 10.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0.w,
                            children: const <Widget>[
                              CardSpeedWidget(
                                title: Lang.speedDownText,
                                value: 9,
                              ),
                              CardSpeedWidget(
                                title: Lang.uploadSpeedText,
                                value: 5,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0.w,
                            mainAxisSpacing: 20.0.h,
                            children: <Widget>[
                              CardMyHostInfoWidget(
                                title: Lang.maxStorageText,
                                value: _myHostDataEntity.maxStoragePrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: Lang.maxContractText,
                                value: _myHostDataEntity.maxContractPrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: Lang.minAccountText,
                                value: _myHostDataEntity.minAccountExpiry
                                    .toString(),
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: Lang.maxRpcText,
                                value: _myHostDataEntity.maxRPCPrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return hosterBuilderState is MyHostDataGetLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ColorsApp.spearmintColor,
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _adressController.dispose();
    _userMailController.dispose();
    _userPasswordController.dispose();
  }
}
