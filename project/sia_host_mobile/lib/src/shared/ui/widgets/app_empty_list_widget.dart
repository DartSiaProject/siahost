import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_host_mobile/src/shared/constants/svgs_const.dart';

class AppEmptyListWidget extends StatelessWidget {
  const AppEmptyListWidget({
    required this.message,
    super.key,
    required this.onRefresh,
    this.showBackButton = false,
  });
  final String message;
  final VoidCallback onRefresh;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        onRefresh.call();
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
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SvgPicture.asset(
                    IconSvgs.emptySvg,
                    width: 185,
                    height: 185,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
