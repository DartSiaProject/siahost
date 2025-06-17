import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.isLoading = false,
    this.isFullSized = false,
    this.isCentered = false,
    this.isProgressing = false,
    this.progressPercentage = 0,
    this.bgColor,
    super.key,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final bool isFullSized;
  final bool isCentered;
  final bool isProgressing;
  final int progressPercentage;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return isProgressing
        ? Center(
            child: CircularPercentIndicator(
              radius: 40,
              animation: true,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.4),
              percent: progressPercentage / 100,
              center: Center(
                child: Text(
                  '$progressPercentage %',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              progressColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          )
        : isLoading
            ? Center(
                child: CupertinoActivityIndicator(
                  color: context.primaryColor,
                ),
              )
            : isCentered
                ? Center(
                    child: _buildButton(context),
                  )
                : _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: isLoading ? null : onPressed,
      icon: icon != null
          ? Icon(
              icon,
              color: Colors.white,
            )
          : null,
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: bgColor ?? context.primaryColor,
        // foregroundColor: Colors.white,
        minimumSize: isFullSized ? Size(1.sw, 50) : const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
