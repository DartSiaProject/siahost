import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../logic/models/host.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/host_widgets/infos_list_widget.dart';
import '../../widgets/host_widgets/price_info_bar_widget.dart';

class HostInfoSubFragment extends StatefulWidget {
  final Host hostModel;
  const HostInfoSubFragment({super.key, required this.hostModel});

  @override
  State<HostInfoSubFragment> createState() => _HostInfoSubFragmentState();
}

class _HostInfoSubFragmentState extends State<HostInfoSubFragment> {
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
                    .translate("host_info_text"),
                style: TextStyle(
                  fontFamily: "DmSans",
                  fontSize: 28.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: color.paleTealColor.withOpacity(0.46),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 8.0,
                  animation: true,
                  reverse: true,
                  backgroundColor: color.spearmintColor.withOpacity(0.4),
                  percent: widget.hostModel.finalScore / 10,
                  center: Text(
                    widget.hostModel.finalScore.toString(),
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w400,
                      color: color.whiteColor,
                      fontSize: 30.0.sp,
                    ),
                  ),
                  progressColor: color.whiteColor,
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
                widget.hostModel.currentIp,
                style: TextStyle(
                  fontFamily: "DmSans",
                  fontSize: 17.0.sp,
                  color: color.lightGreyColor,
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
                SvgPicture.asset(icon.locationSvg),
                SizedBox(
                  width: 5.0.w,
                ),
                Text(
                  widget.hostModel.addressLocationIp,
                  style: TextStyle(
                    fontFamily: "DmSans",
                    fontSize: 17.0.sp,
                    color: color.paleTealColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0.h,
            ),
            PriceInfoBarWidget(
              hostModel: widget.hostModel,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Expanded(
              child: InfoListWidget(
                hostModel: widget.hostModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
