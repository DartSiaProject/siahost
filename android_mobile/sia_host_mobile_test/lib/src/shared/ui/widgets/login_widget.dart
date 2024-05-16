import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/Lang_const.dart';
import '../../constants/colors_const.dart';
import '../../constants/svgs_const.dart';

import '../../../core/configs/Language_config/translator.dart';
import '../../../modules/account_mod/features/user_login/domain/entities/user_login_entity.dart';
import '../../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onCallback;
  final String messageError;

  const LoginWidget({
    super.key,
    required this.messageError,
    required this.onCallback,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _adressController;
  late TextEditingController _passwordController;
  late bool _passwordHidden;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordHidden = true;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginAccountBloc, LoginAccountState>(
      listener: (context, accountListenerState) {
        if (accountListenerState is NewLoginSuccess) {
          Fluttertoast.showToast(
            msg:
                Translator.of(context)!.translate(accountListenerState.message),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: ColorsApp.tunaColor,
            textColor: Colors.white,
            fontSize: 16.0,
          ).whenComplete(widget.onCallback);
        }

        if (accountListenerState is NewLoginFailed) {
          Fluttertoast.showToast(
            msg:
                Translator.of(context)!.translate(accountListenerState.message),
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
              Translator.of(context)!.translate(widget.messageError),
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
                        hintText:
                            Translator.of(context)!.translate(Lang.adressText),
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
                            .translate(Lang.renterdPasswordText),
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
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: Translator.of(context)!
                            .translate(Lang.passwordText),
                        suffixIcon: IconButton(
                          splashRadius: 23.0.r,
                          onPressed: () {
                            context.read<LoginAccountBloc>().add(
                                HideThePassWordEvent(
                                    hideThePassWord: !_passwordHidden));
                            BlocProvider.of<LoginAccountBloc>(context);
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
                            _passwordController.text.isEmpty) {
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
                              passWord: _passwordController.text,
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
    );
  }
}
