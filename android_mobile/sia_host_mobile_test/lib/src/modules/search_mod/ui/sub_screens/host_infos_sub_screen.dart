import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/svgs_const.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart';
import '../widgets/infos_list_widget.dart';
import '../widgets/price_info_bar_widget.dart';

@RoutePage()
class HostInfoScreen extends StatefulWidget {
  final String pubKey;
  const HostInfoScreen(
      {super.key, @PathParam("hostPubKey") required this.pubKey});

  @override
  State<HostInfoScreen> createState() => _HostInfoScreenState();
}

class _HostInfoScreenState extends State<HostInfoScreen> {
  @override
  void initState() {
    context
        .read<FetchOneHostDataAndShowItBloc>()
        .add(FetchOneHostDataEvent(pubKey: widget.pubKey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOneHostDataAndShowItBloc,
        FetchOneHostDataAndShowItState>(
      builder: (context, fetchOneHostDataAndShowItBuilderstate) {
        if (fetchOneHostDataAndShowItBuilderstate is HostDataFetchedSuccess) {
          var _hostInfoEntity =
              fetchOneHostDataAndShowItBuilderstate.hostInfoEntity;

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      Translator.of(context)!.translate(Lang.hostInfoText),
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
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.paleTealColor.withOpacity(0.46),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: CircularPercentIndicator(
                        radius: 35.0,
                        lineWidth: 8.0,
                        animation: true,
                        reverse: true,
                        backgroundColor:
                            ColorsApp.spearmintColor.withOpacity(0.4),
                        percent: _hostInfoEntity.finalScore / 10,
                        center: Text(
                          _hostInfoEntity.finalScore.toString(),
                          style: TextStyle(
                            fontFamily: "Manrope",
                            fontWeight: FontWeight.w400,
                            color: ColorsApp.whiteColor,
                            fontSize: 30.0.sp,
                          ),
                        ),
                        progressColor: ColorsApp.whiteColor,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Text(
                      _hostInfoEntity.currentIp,
                      style: TextStyle(
                        fontFamily: "DmSans",
                        fontSize: 17.0.sp,
                        color: ColorsApp.lightGreyColor,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.clip,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(IconSvgs.locationSvg),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      Text(
                        _hostInfoEntity.addressLocationIp,
                        style: TextStyle(
                          fontFamily: "DmSans",
                          fontSize: 17.0.sp,
                          color: ColorsApp.paleTealColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  PriceInfoBarWidget(
                    hostModel: _hostInfoEntity,
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Expanded(
                    child: InfoListWidget(
                      hostModel: _hostInfoEntity,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: ColorsApp.spearmintColor),
        );
      },
    );
  }
}
