import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    required this.message,
    super.key,
    this.textBtn,
    this.showBtn = true,
    this.onBtnTap,
    this.onRefresh,
  });
  final String message;
  final String? textBtn;
  final VoidCallback? onRefresh;
  final bool showBtn;
  final VoidCallback? onBtnTap;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        onRefresh?.call();
        return;
      },
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/icons/empty.svg',
              width: 185,
              height: 185,
            ),
          ),
          Text(
            message,
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          if (showBtn && textBtn != null)
            Center(
              child: AppButton(
                label: textBtn!,
                onPressed: onBtnTap ?? onRefresh,
              ),
            ),
        ],
      ),
    );
  }
}
