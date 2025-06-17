import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/app/data/models/onboarding_slide.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    required this.slide,
    super.key,
  });

  final OnboardingSlide slide;

  String _getTitle(BuildContext context) {
    final l10n = context.l10n;
    switch (slide.value) {
      case 1:
        return l10n.onboardingTitle1;
      case 2:
        return l10n.onboardingTitle2;
      default:
        return l10n.onboardingTitle3;
    }
  }

  String _getDescription(BuildContext context) {
    final l10n = context.l10n;
    switch (slide.value) {
      case 1:
        return l10n.onboardingDesc1;
      case 2:
        return l10n.onboardingDesc2;
      default:
        return l10n.onboardingDesc3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          slide.imagePath,
          // width: 300.w,
          height: 300.h,
        ),
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              _getTitle(context),
              style: context.textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _getDescription(context),
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
