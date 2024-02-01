import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;
import 'package:sia_host_mobile/src/shared/constants/pngs_const.dart' as png;
import 'package:sia_host_mobile/src/shared/constants/routes_const.dart';
import 'package:sia_host_mobile/src/shared/constants/svgs_const.dart' as icon;

import '../../../../core/configs/language_config/translator.dart';
import '../../features/user_login/domain/entities/user_login_entity.dart';
import '../../features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';

@RoutePage()
class LoginAccountScreen extends StatefulWidget {
  const LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginAccountScreenState();
}

class _LoginAccountScreenState extends State<LoginAccountScreen> {
  late TextEditingController _adressController;
  late TextEditingController _passwordController;
  late ScrollController _scrollController;
  late bool _passwordHidden;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _passwordController = TextEditingController();
    _scrollController = ScrollController();
    _passwordHidden = true;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<LoginAccountBloc, LoginAccountState>(
        listener: (context, loginAccountListenerState) {
          if (loginAccountListenerState is LoginSuccess) {
            Fluttertoast.showToast(
              msg: Translator.of(context)!
                  .translate(loginAccountListenerState.message),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: color.tunaColor,
              textColor: Colors.white,
              fontSize: 16.0,
            ).whenComplete(
                () => context.router.replaceNamed(RoutePath.siaMainPath));
          }

          if (loginAccountListenerState is LoginFailed) {
            Fluttertoast.showToast(
              msg: Translator.of(context)!
                  .translate(loginAccountListenerState.message),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: color.tunaColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, loginAccountBuilderState) {
          if (loginAccountBuilderState is PasswordHidded) {
            _passwordHidden = loginAccountBuilderState.passWordIsHided;
          }
          if (loginAccountBuilderState is LoginLoading) {
            _isLoading = true;
          } else {
            _isLoading = false;
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0.h,
                    ),
                    Image.asset(
                      png.secureServerPng,
                      width: 200.0.w,
                      height: 204.85.h,
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Text(
                      Translator.of(context)!
                          .translate(lang.loginDescriptionText),
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 17.0.sp,
                        color: color.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
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
                                    .translate(lang.adressPublicText),
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16.0.sp,
                                  color: color.whiteColor,
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
                                    .translate(lang.adressText),
                              ),
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                color: color.ironsideGreyColor,
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
                                    .translate(lang.renterdPasswordText),
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16.0.sp,
                                  color: color.whiteColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              obscureText: _passwordHidden,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: Translator.of(context)!
                                    .translate(lang.passwordText),
                                suffixIcon: IconButton(
                                  splashRadius: 23.0.r,
                                  onPressed: () {
                                    BlocProvider.of<LoginAccountBloc>(context)
                                        .add(HideThePassWordEvent(
                                            hideThePassWord: !_passwordHidden));
                                  },
                                  color: color.whiteColor,
                                  icon: SvgPicture.asset(
                                    _passwordHidden
                                        ? icon.eyeOnSvg
                                        : icon.eyeOffSvg,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                color: color.ironsideGreyColor,
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
                            color: color.spearmintColor,
                            borderRadius: BorderRadius.circular(12.0.r),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.0.r),
                              onTap: () {
                                if (_adressController.text.isEmpty ||
                                    _passwordController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: Translator.of(context)!
                                        .translate(lang.fillFieldsText),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    backgroundColor: color.tunaColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  BlocProvider.of<LoginAccountBloc>(context)
                                      .add(MakeLoginEvent(
                                    userLoginEntity: UserLoginEntity(
                                      serverAddress: _adressController.text,
                                      passWord: _passwordController.text,
                                    ),
                                  ));
                                }
                              },
                              child: Center(
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color: color.whiteColor,
                                      )
                                    : Text(
                                        Translator.of(context)!
                                            .translate(lang.connectText),
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
                          height: 10.0.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () => context.router
                                .replaceNamed(RoutePath.siaMainPath),
                            child: Text(
                              Translator.of(context)!
                                  .translate(lang.connectLaterText),
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16.0.sp,
                                color: color.whiteColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _adressController.dispose();
    _passwordController.dispose();
  }
}
