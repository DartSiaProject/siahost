import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;
import 'package:sia_host_mobile/src/shared/constants/svgs_const.dart' as icon;

import '../../../../../core/configs/language_config/translator.dart';

class BarChartNetwokingWidget extends StatefulWidget {
  final List<int> activeContractCount;

  const BarChartNetwokingWidget({super.key, required this.activeContractCount});

  @override
  State<StatefulWidget> createState() => BarChartNetwokingWidgetState();
}

class BarChartNetwokingWidgetState extends State<BarChartNetwokingWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.tunaColor,
      borderRadius: BorderRadius.circular(12.0.r),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    Translator.of(context)!.translate(lang.dailytext),
                    style: TextStyle(
                      fontFamily: "DmSans",
                      color: color.rockBlueColor,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    widget.activeContractCount.length.toString(),
                    style: TextStyle(
                      fontFamily: "DmSans",
                      color: color.whiteColor,
                      fontSize: 34.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        icon.checkTrackSvg,
                        width: 15.0.w,
                        height: 15.0.h,
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      Text(
                        Translator.of(context)!.translate(lang.trackText),
                        style: TextStyle(
                          fontFamily: "DmSans",
                          color: color.caribbeanGreenColor,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BarChart(
                        mainBarData(),
                        // swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        icon.arrowDropUpSvg,
                        width: 25.0.w,
                        height: 25.0.h,
                      ),
                      Text(
                        "+2.45%",
                        style: TextStyle(
                          fontFamily: "DmSans",
                          fontSize: 12.0.sp,
                          color: color.caribbeanGreenColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color.spearmintColor,
          width: 18.0.w,
          borderSide: const BorderSide(
            color: color.spearmintColor,
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 25,
            color: color.blueChalkColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => widget.activeContractCount.isEmpty
      ? []
      : List.generate(8, (index) {
          return makeGroupData(
            index,
            widget.activeContractCount[index].toDouble(),
          );
        });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }
}
