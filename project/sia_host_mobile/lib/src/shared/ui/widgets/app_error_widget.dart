import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/configs/language_config/translator.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.onRefresh,
    required this.message,
    super.key,
    this.showBackButton = false,
  });
  final VoidCallback onRefresh;
  final String message;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        onRefresh();
        return;
      },
      child: Scaffold(
        appBar: showBackButton
            ? AppBar(
                leading: BackButton(
                  onPressed: () {
                    context.maybePop();
                  },
                ),
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.exclamationmark_triangle,
                  color: Colors.red,
                  size: 80.h,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.orange.shade800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: onRefresh,
                  icon: const Icon(CupertinoIcons.arrow_clockwise),
                  label: Text(
                    Translator.of(context)!.translate(Lang.retryText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
