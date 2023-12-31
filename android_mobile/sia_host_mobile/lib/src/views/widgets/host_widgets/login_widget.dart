import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../logic/controllers/account_bloc/account_bloc.dart';
import '../../../logic/controllers/hoster_bloc/hoster_bloc.dart';
import '../../../logic/models/account.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';

class LoginWidget extends StatefulWidget {
  final String messageError;

  const LoginWidget({super.key, required this.messageError});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _adressController;
  late TextEditingController _passwordController;
  late bool _passwordHidden;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, accountListenerState) {
        if (accountListenerState is NewLoginSuccess) {
          Fluttertoast.showToast(
            msg: LanguageTranslationHelper.of(context)!
                .translate(accountListenerState.message),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: color.tunaColor,
            textColor: Colors.white,
            fontSize: 16.0,
          ).whenComplete(() => BlocProvider.of<HosterBloc>(context)
              .add(GetMyHostFromRenterdEvent()));
        }

        if (accountListenerState is NewLoginFailed) {
          Fluttertoast.showToast(
            msg: LanguageTranslationHelper.of(context)!
                .translate(accountListenerState.message),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: color.tunaColor,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, accountBuilderState) {
        if (accountBuilderState is PasswordHidded) {
          _passwordHidden = accountBuilderState.passWordIsHided;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate(widget.messageError),
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20.0.sp,
                color: color.whiteColor,
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
                        LanguageTranslationHelper.of(context)!
                            .translate("adress_public_text"),
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0.sp,
                          color: color.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: _adressController,
                      decoration: InputDecoration(
                        hintText: LanguageTranslationHelper.of(context)!
                            .translate("adress_text"),
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
                        LanguageTranslationHelper.of(context)!
                            .translate("renterd_password_text"),
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
                        hintText: LanguageTranslationHelper.of(context)!
                            .translate("password_text"),
                        suffixIcon: IconButton(
                          splashRadius: 23.0.r,
                          onPressed: () {
                            BlocProvider.of<AccountBloc>(context).add(
                                HideThePassWordEvent(
                                    hideThePassWord: !_passwordHidden));
                          },
                          color: color.whiteColor,
                          icon: SvgPicture.asset(
                            _passwordHidden ? icon.eyeOffSvg : icon.eyeOnSvg,
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
                            msg: LanguageTranslationHelper.of(context)!
                                .translate("fill_fields_text"),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            backgroundColor: color.tunaColor,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          BlocProvider.of<AccountBloc>(context)
                              .add(MakeNewLoginEvent(
                            account: Account(
                              ipAddress: _adressController.text,
                              passWord: _passwordController.text,
                            ),
                          ));
                        }
                      },
                      child: Center(
                        child: accountBuilderState is NewLoginLoading
                            ? const CircularProgressIndicator(
                                color: color.whiteColor,
                              )
                            : Text(
                                LanguageTranslationHelper.of(context)!
                                    .translate("connect_text"),
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
              ],
            ),
          ],
        );
      },
    );
  }
}
