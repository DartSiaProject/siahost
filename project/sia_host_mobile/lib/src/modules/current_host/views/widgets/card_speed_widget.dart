import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';

class CardSpeedWidget extends StatelessWidget {
  const CardSpeedWidget({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 16.0.h,
            ),
            CircularPercentIndicator(
              radius: 40,
              lineWidth: 8,
              animation: true,
              reverse: true,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.4),
              percent: value / 10,
              center: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    value.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Mbps',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
              progressColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
