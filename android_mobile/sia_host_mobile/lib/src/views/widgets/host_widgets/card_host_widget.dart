import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/logic/controllers/search_bloc/search_bloc.dart';

import '../../../logic/models/host.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';

class CardHostWidget extends StatelessWidget {
  final Host host;
  const CardHostWidget({
    super.key,
    required this.host,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<SearchBloc>(context)
          .add(NextSubPageIndexEvent(index: 1, hostModel: host)),
      child: Container(
          margin: EdgeInsets.only(bottom: 15.0.h),
          decoration: BoxDecoration(
              color: color.tunaColor,
              borderRadius: BorderRadius.circular(12.0.r),
              border: const Border.fromBorderSide(BorderSide.none)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              margin: EdgeInsets.only(left: 15.0.w),
              decoration: BoxDecoration(
                color: color.paleTealColor.withOpacity(0.46),
                borderRadius: BorderRadius.circular(12.0.r),
                border: const Border.fromBorderSide(BorderSide.none),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: 17.0,
                  lineWidth: 4.0,
                  animation: true,
                  reverse: true,
                  backgroundColor: color.spearmintColor.withOpacity(0.4),
                  percent: host.finalScore / 10,
                  center: Text(
                    host.finalScore.toString(),
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w400,
                      color: color.whiteColor,
                      fontSize: 12.0.sp,
                    ),
                  ),
                  progressColor: color.whiteColor,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
            ),
            title: Text(
              "${LanguageTranslationHelper.of(context)!.translate("host_pub_key_text")} : ${host.pubkey}",
              style: TextStyle(
                fontFamily: "Manrope",
                fontWeight: FontWeight.w600,
                color: color.cottonSeedColor,
                fontSize: 12.0.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            subtitle: Text(
              "${LanguageTranslationHelper.of(context)!.translate("total_text")} : ${host.totalStorage}  Tb",
              style: TextStyle(
                fontFamily: "Manrope",
                fontWeight: FontWeight.w400,
                color: color.whiteColor,
                fontSize: 12.0.sp,
              ),
            ),
            trailing: PopupMenuButton(
              padding: const EdgeInsets.all(0),
              position: PopupMenuPosition.under,
              splashRadius: 20.0.r,
              icon: SvgPicture.asset(
                icon.moreVerticalSvg,
                width: 4.25.w,
                height: 18.0.h,
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    child: Text("Hello"),
                    value: '/hello',
                  ),
                  PopupMenuItem(
                    child: Text("About"),
                    value: '/about',
                  ),
                  PopupMenuItem(
                    child: Text("Contact"),
                    value: '/contact',
                  )
                ];
              },
              onSelected: (value) {},
            ),
          )),
    );
  }
}
