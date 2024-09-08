import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/routes_const.dart';
import '../../../../shared/constants/svgs_const.dart';
import '../../../account_mod/features/user_login/domain/entities/user_login_entity.dart';
import '../../../account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart';
import '../../features/fetch_all_buckets_and_files/states_holder/fetch_all_bucket_bloc/fetch_all_bucket_bloc.dart';
import '../widgets/card_of_bucket_widget.dart';

@RoutePage()
class ListOfBucketScreen extends StatefulWidget {
  const ListOfBucketScreen({super.key});

  @override
  State<ListOfBucketScreen> createState() => _ListOfBucketScreenState();
}

class _ListOfBucketScreenState extends State<ListOfBucketScreen> {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Translator.of(context)!.translate(Lang.bucketsFileText),
          style: TextStyle(
            fontFamily: "Manrope",
            fontSize: 28.0.sp,
            color: ColorsApp.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Expanded(
          child: BlocBuilder<FetchAllBucketBloc, FetchAllBucketState>(
            builder: (context, fetchAllBucketBuilderState) {
              if (fetchAllBucketBuilderState is MakLoginToSeeTheBucket) {
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
                            .read<FetchAllBucketBloc>()
                            .add(FetchBucketsEvent());
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
                                  fetchAllBucketBuilderState.message),
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
                                      borderRadius:
                                          BorderRadius.circular(12.0.r),
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
                                                  _userPasswordController.text,
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
                );
              }
              if (fetchAllBucketBuilderState is AllBucketFetchedSuccess) {
                return RefreshIndicator.adaptive(
                  color: ColorsApp.spearmintColor,
                  backgroundColor: ColorsApp.bleachedCedarColor,
                  onRefresh: () async {
                    context.read<FetchAllBucketBloc>().add(FetchBucketsEvent());
                  },
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: fetchAllBucketBuilderState.allBuckets.length,
                    itemBuilder: (BuildContext context, int bucketIndex) {
                      var _bucketData =
                          fetchAllBucketBuilderState.allBuckets[bucketIndex];
                      return Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: CardOfBucketWidget(
                          totalFiles: _bucketData.totalFiles,
                          label: _bucketData.nameBucket,
                          onPressed: () {
                            context.router.pushNamed(
                                "${RoutePath.listOfFileFetchedFromBucketSubPath}/${_bucketData.nameBucket}");
                          },
                        ),
                      );
                    },
                  ),
                );
              }

              if (fetchAllBucketBuilderState is AllBucketFetchedEmpty) {
                return Center(
                  child: Text(
                    Translator.of(context)!
                        .translate(fetchAllBucketBuilderState.message),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20.0.sp,
                      color: ColorsApp.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (fetchAllBucketBuilderState is AllBucketFetchedFailed) {
                return Center(
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        Translator.of(context)!
                            .translate(fetchAllBucketBuilderState.message),
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
                          onTap: () {
                            context
                                .read<FetchAllBucketBloc>()
                                .add(FetchBucketsEvent());
                          },
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

              return fetchAllBucketBuilderState is AllBucketFetchedLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: ColorsApp.spearmintColor),
                    )
                  : Container();
            },
          ),
        )
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
