import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0.h),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppTheme.primaryColor,
            width: 3,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(5),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
          ),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
