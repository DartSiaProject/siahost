import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../widgets/network_widgets/card_network_widget.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 10.0.h,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Material(
                borderRadius: BorderRadius.circular(5.0.r),
                color: color.tunaColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5.0.r),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(
                      icon.smsNotifsSvg,
                      width: 24.0.w,
                      height: 24.0.h,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate("network_view_text"),
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 28.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Expanded(
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
                          value: 356,
                          descriptifText: LanguageTranslationHelper.of(context)!
                              .translate("current_host_text"),
                          valuePercent: 2,
                        ),
                        CardNetworkWidget(
                          value: 356,
                          descriptifText: LanguageTranslationHelper.of(context)!
                              .translate("total_network_text"),
                          valuePercent: 2,
                        ),
                        CardNetworkWidget(
                          value: 356,
                          descriptifText: LanguageTranslationHelper.of(context)!
                              .translate("total_used_text"),
                          valuePercent: 2,
                        ),
                        CardNetworkWidget(
                          value: 356,
                          descriptifText: LanguageTranslationHelper.of(context)!
                              .translate("price_per_text"),
                          valuePercent: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Container(
                      width: 306.0.w,
                      height: 235.0.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      decoration: BoxDecoration(
                          color: color.tunaColor,
                          borderRadius: BorderRadius.circular(12.0.r)),
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        direction: Axis.vertical,
                        children: <Widget>[
                          Text(
                            LanguageTranslationHelper.of(context)!
                                .translate("network_view_text"),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16.0.sp,
                              color: color.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Card(
                            color: color.tunaColor,
                            shape: const RoundedRectangleBorder(),
                            elevation: 10,
                            child: Sparkline(
                              data: const [
                                9,
                                6,
                                8,
                                5,
                                5,
                                5,
                                4,
                                7,
                                5,
                                6,
                                8,
                                10,
                              ],
                              lineWidth: 3.0,
                              lineColor: color.spearmintColor,
                              fillMode: FillMode.below,
                              fillColor: color.spearmintColor,
                              fallbackHeight: 169.0.h,
                              useCubicSmoothing: true,
                              pointsMode: PointsMode.last,
                              pointColor: color.spearmintColor,
                              pointSize: 8.0,
                              fillGradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  color.lightGreyColor.withOpacity(0.0),
                                  color.lightGreyColor
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
