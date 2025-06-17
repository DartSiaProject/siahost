import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class CardNetworkWidget extends StatelessWidget {
  const CardNetworkWidget({
    required this.value,
    required this.description,
    required this.percentage,
    super.key,
  });

  final String value;
  final String description;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Text(
                value,
                style: context.textTheme.headlineLarge,
              ),
            ),
            Text(
              description,
              style: context.textTheme.bodyMedium,
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.arrow_drop_up_rounded,
                  color: AppTheme.primaryColor,
                ),
                Text(
                  '+$percentage%',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
