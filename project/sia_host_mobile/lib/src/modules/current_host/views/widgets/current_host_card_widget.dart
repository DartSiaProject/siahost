import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';

class CurrentHostCardWidget extends StatelessWidget {
  const CurrentHostCardWidget({
    required this.title,
    required this.value,
    required this.padding,
    super.key,
  });
  final String title;
  final String value;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 160.0.w,
        padding: EdgeInsets.all(15.0.r),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppTheme.primaryColor,
                width: 3,
              ),
            ),
          ),
          // alignment: Alignment.centerLeft,
          padding: padding,
          child: Column(
            spacing: 6.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                value.isEmpty
                    ? ''
                    : value.length > 2
                        ? value.substring(0, 3)
                        : value,
                style: context.textTheme.headlineLarge,
              ),
              Text(
                title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
