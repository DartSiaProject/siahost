import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;
import 'package:sia_host_mobile/src/shared/ui/widgets/login_widget.dart';

import '../../../../core/configs/language_config/translator.dart';
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
              Translator.of(context)!.translate(lang.myHostText),
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
            child: BlocBuilder<FetchMyHosterBloc, FetchMyHosterState>(
              builder: (context, hosterBuilderState) {
                if (hosterBuilderState is MakLoginPlease) {
                  return Center(
                    child: LoginWidget(
                      messageError: hosterBuilderState.message,
                      onCallback: () {
                        context
                            .read<FetchMyHosterBloc>()
                            .add(FetchMyHostFromRenterdEvent());
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
                            onTap: () => context
                                .read<FetchMyHosterBloc>()
                                .add(FetchMyHostFromRenterdEvent()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Translator.of(context)!
                                    .translate(lang.retryText),
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
                  var _myHostDataEntity = hosterBuilderState.myHostDataEntity;

                  return RefreshIndicator(
                    color: color.spearmintColor,
                    backgroundColor: color.bleachedCedarColor,
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
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.65.r,
                              children: <Widget>[
                                Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          Translator.of(context)!
                                              .translate(lang.serverHostText),
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
                                          _myHostDataEntity.blockHeight.isEmpty
                                              ? ""
                                              : _myHostDataEntity.blockHeight
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
                                      title: lang.maxDownloadText,
                                      value: _myHostDataEntity.maxDownloadPrice,
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    CardMyHostInfoWidget(
                                      title: lang.maxUploadText,
                                      value: _myHostDataEntity.maxUploadPrice,
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
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
                                  title: lang.speedDownText,
                                  value: 9,
                                ),
                                CardSpeedWidget(
                                  title: lang.uploadSpeedText,
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
                              // childAspectRatio: 1.34.r,
                              children: <Widget>[
                                CardMyHostInfoWidget(
                                  title: lang.maxStorageText,
                                  value: _myHostDataEntity.maxStoragePrice,
                                  padding: const EdgeInsets.only(left: 10.0),
                                ),
                                CardMyHostInfoWidget(
                                  title: lang.maxContractText,
                                  value: _myHostDataEntity.maxContractPrice,
                                  padding: const EdgeInsets.only(left: 10.0),
                                ),
                                CardMyHostInfoWidget(
                                  title: lang.minAccountText,
                                  value: _myHostDataEntity.minAccountExpiry
                                      .toString(),
                                  padding: const EdgeInsets.only(left: 10.0),
                                ),
                                CardMyHostInfoWidget(
                                  title: lang.maxRpcText,
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

                return const Center(
                  child: CircularProgressIndicator(
                    color: color.spearmintColor,
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
