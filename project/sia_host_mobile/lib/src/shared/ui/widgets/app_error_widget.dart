import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.onRefresh,
    required this.message,
    super.key,
  });
  final VoidCallback onRefresh;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              color: Colors.red,
              size: 80.h,
            ),
            Text(
              message,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: Colors.orange.shade800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.tonalIcon(
              onPressed: onRefresh,
              icon: const Icon(CupertinoIcons.arrow_clockwise),
              label: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget to display an error message when paginating data
/// Here we need to display it at the bottom of the list
/// so we can't use the AppErrorWidget
class PaginateErrorWidget extends StatelessWidget {
  const PaginateErrorWidget({
    required this.onRetry,
    this.message = 'Impossible de charger les données',
    super.key,
  });

  final VoidCallback onRetry;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_triangle,
            color: Colors.red,
            size: 80.h,
          ),
          Text(
            message!,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: Colors.orange.shade800),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(CupertinoIcons.arrow_clockwise),
            label: const Text('Raffraichir'),
          ),
        ],
      ),
    );
  }
}
