import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart';
import '../widgets/network_widgets/card_network_widget.dart';
import '../widgets/network_widgets/chart_bar_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                Translator.of(context)!.translate(Lang.networkViewText),
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
              child: BlocBuilder<NetworkDataFetchingBloc,
                  NetworkDataFetchingState>(
                builder: (context, networkDataFetchingBuilderState) {
                  if (networkDataFetchingBuilderState
                      is NetworkDataFetchedFailed) {
                    return Center(
                      child: Flex(
                        mainAxisSize: MainAxisSize.min,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            Translator.of(context)!.translate(
                                networkDataFetchingBuilderState.message),
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
                                  .read<NetworkDataFetchingBloc>()
                                  .add(FetchNetworkDataEvent()),
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

                  if (networkDataFetchingBuilderState
                      is NetworkDataFetchedSuccess) {
                    var _networkDataEntity =
                        networkDataFetchingBuilderState.networkDataEntity;

                    return RefreshIndicator(
                      color: ColorsApp.spearmintColor,
                      backgroundColor: ColorsApp.bleachedCedarColor,
                      onRefresh: () async {
                        context
                            .read<NetworkDataFetchingBloc>()
                            .add(FetchNetworkDataEvent());
                      },
                      child: SingleChildScrollView(
                        child: Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 35,
                              mainAxisSpacing: 35,
                              children: <Widget>[
                                CardNetworkWidget(
                                  value: _networkDataEntity.totalCurrentHosts
                                      .toString(),
                                  descriptifText: Translator.of(context)!
                                      .translate(Lang.currentHostText),
                                  valuePercent: 2,
                                ),
                                CardNetworkWidget(
                                  value:
                                      "${_networkDataEntity.totalNetworkStorage.toStringAsPrecision(5).substring(0, 4)} Pb",
                                  descriptifText: Translator.of(context)!
                                      .translate(Lang.totalNetworkText),
                                  valuePercent: 2,
                                ),
                                CardNetworkWidget(
                                  value:
                                      "${_networkDataEntity.totalUsedStorage.toStringAsPrecision(5).substring(0, 4)} Pb",
                                  descriptifText: Translator.of(context)!
                                      .translate(Lang.totalUsedText),
                                  valuePercent: 2,
                                ),
                                CardNetworkWidget(
                                  value:
                                      "\$${_networkDataEntity.pricePerTb.toStringAsPrecision(5).substring(0, 4)}",
                                  descriptifText: Translator.of(context)!
                                      .translate(Lang.pricePerText),
                                  valuePercent: 2,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            BarChartNetwokingWidget(
                              activeContractCount:
                                  _networkDataEntity.activeContractCount,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.spearmintColor,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
