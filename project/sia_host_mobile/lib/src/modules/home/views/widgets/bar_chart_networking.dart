import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/home/data/models/network_data.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class BarChartNetworking extends StatelessWidget {
  const BarChartNetworking({
    required this.siaUsdQuote,
    super.key,
  });

  List<int> get activeContractCount => [1, 2, 3, 4, 5, 6, 4, 8, 9, 10];
  final SiaUsdQuote siaUsdQuote;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 4.0.h,
                children: <Widget>[
                  // Text(
                  //   context.l10n.dailyActiveContracts,
                  //   style: context.textTheme.bodyMedium,
                  // ),
                  // Text(
                  //   activeContractCount.length.toString(),
                  //   style: context.textTheme.headlineMedium,
                  // ),
                  Text(
                    'SC/USDT',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text.rich(
                    TextSpan(
                      text: siaUsdQuote.price.toStringAsFixed(6),
                      style: context.textTheme.headlineMedium,
                      children: [
                        TextSpan(
                          text: 'USDT',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppTheme.primaryColor,
                      ),
                      SizedBox(
                        width: 4.0.w,
                      ),
                      Text(
                        context.l10n.onTrack,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppTheme.primaryColor,
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
                        _buildBarChartData(),
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
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topRight,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.arrow_drop_up_rounded),
                    Text(
                      '+2.45%',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BarChart data widget
  ///
  BarChartData _buildBarChartData() {
    return BarChartData(
      titlesData: const FlTitlesData(
        rightTitles: AxisTitles(),
        topTitles: AxisTitles(),
        bottomTitles: AxisTitles(),
        leftTitles: AxisTitles(),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildBarGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    if (activeContractCount.isEmpty) return [];

    return List.generate(
      8,
      (index) {
        return _buildGroupData(
          index,
          activeContractCount[index].toDouble(),
        );
      },
    );
  }

  BarChartGroupData _buildGroupData(
    int x,
    double y, {
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppTheme.primaryColor,
          width: 18.0.w,
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 25,
            color: const Color(0xFFE9EDF7),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
