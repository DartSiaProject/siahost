import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      builder: (context) {
        return Material(
          color: AppTheme.backgoundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Container(
                height: 8,
                alignment: Alignment.center,
                width: 100,
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Flexible(
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}
