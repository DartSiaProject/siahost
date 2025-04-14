import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/shared/constants/svgs_const.dart';

import '../../../core/configs/language_config/translator.dart';
import '../../../modules/account_mod/features/user_login/domain/entities/user_login_entity.dart';
import '../../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';
import '../../constants/colors_const.dart';
import '../../constants/lang_const.dart';

class CustomLoginWidget extends StatefulWidget {
  const CustomLoginWidget({
    super.key,
    required this.onLoginSuccess,
    this.showBackButton = false,
  });

  final VoidCallback onLoginSuccess;
  final bool showBackButton;

  @override
  State<CustomLoginWidget> createState() => _CustomLoginWidgetState();
}

class _CustomLoginWidgetState extends State<CustomLoginWidget> {
  late TextEditingController _adressController;
  late TextEditingController _userMailController;
  late TextEditingController _userPasswordController;
  late bool _passwordHidden;
  late bool _isLoginLoading;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _userMailController = TextEditingController();
    _userPasswordController = TextEditingController();
    _passwordHidden = true;
    _isLoginLoading = false;
  }

  @override
  void dispose() {
    _adressController.dispose();
    _userMailController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showBackButton
          ? AppBar(
              backgroundColor: ColorsApp.tunaColor,
              leading: BackButton(
                onPressed: () {
                  context.maybePop();
                },
              ),
            )
          : null,
      body: BlocConsumer<LoginAccountBloc, LoginAccountState>(
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
              widget.onLoginSuccess();
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
              padding: EdgeInsets.symmetric(
                  horizontal: widget.showBackButton ? 16 : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Translator.of(context)!.translate(
                      Lang.makeLoginDemandText,
                    ),
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
                                  BlocProvider.of<LoginAccountBloc>(context)
                                      .add(HideThePassWordEvent(
                                          hideThePassWord: !_passwordHidden));
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
                                  _userPasswordController.text.isEmpty) {
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
                                BlocProvider.of<LoginAccountBloc>(context)
                                    .add(MakeNewLoginEvent(
                                  userLoginEntity: UserLoginEntity(
                                    serverAddress: _adressController.text,
                                    mailAdress: _userMailController.text,
                                    passWord: _userPasswordController.text,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
