import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/controllers/network_bloc/network_bloc.dart';
import '../../../logic/models/host.dart';
import '../../../logic/models/network.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/network_widgets/card_network_widget.dart';
import '../../widgets/network_widgets/chart_bar_widget.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late double _totalCurrentHosts;
  late double _totalNetworkStorage;
  late double _totalUsedStorage;
  late double _pricePerTb;
  late List<int> _activeContractCount;
  late List<Host> _hostModelList;
  late Network _networDataModel;
  @override
  void initState() {
    super.initState();
    _totalCurrentHosts = 0.0;
    _totalNetworkStorage = 0.0;
    _totalUsedStorage = 0.0;
    _pricePerTb = 0.0;
    _activeContractCount = [];
    _hostModelList = [];
    // _networDataModel = Network();
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
                LanguageTranslationHelper.of(context)!
                    .translate("network_view_text"),
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
              child: BlocBuilder<NetworkBloc, NetworkState>(
                builder: (context, networkBuilderState) {
                  if (networkBuilderState is HostLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: color.spearmintColor,
                      ),
                    );
                  }

                  if (networkBuilderState is NetworkDataGetFailed) {
                    return Center(
                      child: Flex(
                        mainAxisSize: MainAxisSize.min,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            LanguageTranslationHelper.of(context)!
                                .translate(networkBuilderState.message),
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
                              onTap: () => BlocProvider.of<NetworkBloc>(context)
                                  .add(GetNetworkDataEvent()),
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

                  if (networkBuilderState is NetworkDataGetSuccess) {
                    _hostModelList =
                        networkBuilderState.networkData["hostModelList"];
                    _networDataModel =
                        networkBuilderState.networkData["networkModel"];

                    _totalCurrentHosts = _hostModelList.length.toDouble();
                    _totalNetworkStorage = _networDataModel.networkCapacityTB;
                    _totalUsedStorage =
                        _networDataModel.usedStorageTB.toDouble();
                    _pricePerTb = _networDataModel.pricePerTbUsd;
                    _activeContractCount = networkBuilderState
                        .networkData["activeContractCountList"];
                  }
                  return RefreshIndicator(
                    color: color.spearmintColor,
                    backgroundColor: color.bleachedCedarColor,
                    onRefresh: () async {
                      BlocProvider.of<NetworkBloc>(context)
                          .add(GetNetworkDataEvent());
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
                                value: _totalCurrentHosts,
                                descriptifText:
                                    LanguageTranslationHelper.of(context)!
                                        .translate("current_host_text"),
                                valuePercent: 2,
                              ),
                              CardNetworkWidget(
                                value: _totalNetworkStorage,
                                descriptifText:
                                    LanguageTranslationHelper.of(context)!
                                        .translate("total_network_text"),
                                valuePercent: 2,
                              ),
                              CardNetworkWidget(
                                value: _totalUsedStorage,
                                descriptifText:
                                    LanguageTranslationHelper.of(context)!
                                        .translate("total_used_text"),
                                valuePercent: 2,
                              ),
                              CardNetworkWidget(
                                value: _pricePerTb,
                                descriptifText:
                                    LanguageTranslationHelper.of(context)!
                                        .translate("price_per_text"),
                                valuePercent: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          BarChartNetwokingWidget(
                            activeContractCount: _activeContractCount,
                          ),
                        ],
                      ),
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
