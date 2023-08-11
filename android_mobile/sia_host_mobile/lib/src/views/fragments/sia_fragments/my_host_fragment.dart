import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/logic/controllers/hoster_bloc/hoster_bloc.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';
import 'package:sia_host_mobile/src/views/widgets/host_widgets/login_widget.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/host_widgets/card_my_host_info_widget.dart';
import '../../widgets/host_widgets/card_speed_widget.dart';

class MyHostFragment extends StatefulWidget {
  const MyHostFragment({super.key});

  @override
  State<MyHostFragment> createState() => _MyHostFragmentState();
}

class _MyHostFragmentState extends State<MyHostFragment> {
  late HostSetting _hostSetting;

  @override
  void initState() {
    super.initState();

    _hostSetting = const HostSetting();
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
              LanguageTranslationHelper.of(context)!.translate("my_host_text"),
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
            child: BlocBuilder<HosterBloc, HosterState>(
              bloc: BlocProvider.of<HosterBloc>(context)
                ..add(GetMyHostFromRenterdEvent()),
              builder: (context, hosterBuilderState) {
                if (hosterBuilderState is MyHostLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: color.spearmintColor,
                    ),
                  );
                }

                if (hosterBuilderState is MakLoginPlease) {
                  return Center(
                    child: LoginWidget(
                      messageError: hosterBuilderState.message,
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
                          LanguageTranslationHelper.of(context)!
                              .translate(hosterBuilderState.message),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20.0.sp,
                            color: color.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Material(
                          color: color.spearmintColor,
                          borderRadius: BorderRadius.circular(12.0.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.0.r),
                            onTap: () => BlocProvider.of<HosterBloc>(context)
                                .add(GetMyHostFromRenterdEvent()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                LanguageTranslationHelper.of(context)!
                                    .translate("retry_text"),
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0.sp,
                                  color: color.whiteColor,
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
                  _hostSetting = hosterBuilderState.hostSetting;
                }

                return RefreshIndicator(
                  color: color.spearmintColor,
                  backgroundColor: color.bleachedCedarColor,
                  onRefresh: () async => BlocProvider.of<HosterBloc>(context)
                      .add(GetMyHostFromRenterdEvent()),
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
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.73.r,
                            children: <Widget>[
                              Container(
                                height: 251.0.h,
                                decoration: BoxDecoration(
                                  color: color.tunaColor,
                                  borderRadius: BorderRadius.circular(12.0.r),
                                ),
                                padding: EdgeInsets.all(15.0.r),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: color.spearmintColor,
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
                                        LanguageTranslationHelper.of(context)!
                                            .translate("server_host_text"),
                                        style: TextStyle(
                                          fontFamily: "Manrope",
                                          fontSize: 12.0.sp,
                                          color: color.cottonSeedColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.0.h,
                                      ),
                                      Text(
                                        _hostSetting.blockHeight.isEmpty
                                            ? ""
                                            : _hostSetting.blockHeight
                                                .substring(0, 3),
                                        style: TextStyle(
                                          fontFamily: "Manrope",
                                          fontSize: 24.0.sp,
                                          color: color.whiteColor,
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
                                    title: "max_download_text",
                                    value: _hostSetting.maxDownloadPrice,
                                    padding: const EdgeInsets.only(left: 10.0),
                                  ),
                                  SizedBox(
                                    height: 15.0.h,
                                  ),
                                  CardMyHostInfoWidget(
                                    title: "max_upload_text",
                                    value: _hostSetting.maxUploadPrice,
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
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: const <Widget>[
                              CardSpeedWidget(
                                title: "speed_down_text",
                                value: 9,
                              ),
                              CardSpeedWidget(
                                title: "upload_speed_text",
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
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.62.r,
                            children: <Widget>[
                              CardMyHostInfoWidget(
                                title: "max_storage_text",
                                value: _hostSetting.maxStoragePrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: "max_contract_text",
                                value: _hostSetting.maxContractPrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: "min_account_text",
                                value: _hostSetting.minAccountExpiry.toString(),
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                              CardMyHostInfoWidget(
                                title: "max_rpc_text",
                                value: _hostSetting.maxRPCPrice,
                                padding: const EdgeInsets.only(left: 10.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
