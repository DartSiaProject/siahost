import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class AppBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) {
        return Column(
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
        );
      },
    );
  }
}
