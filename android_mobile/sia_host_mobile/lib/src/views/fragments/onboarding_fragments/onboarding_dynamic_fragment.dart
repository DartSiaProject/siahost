import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';

class OnboardingDynamicFragment extends StatefulWidget {
  final Map<String, dynamic> onboarding;
  const OnboardingDynamicFragment({
    super.key,
    required this.onboarding,
  });

  @override
  State<OnboardingDynamicFragment> createState() =>
      _OnboardingDynamicFragmentState();
}

class _OnboardingDynamicFragmentState extends State<OnboardingDynamicFragment> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      direction: Axis.vertical,
      children: <Widget>[
        Image.asset(
          widget.onboarding["img"]["image"],
          width: widget.onboarding["img"]["width"],
          height: widget.onboarding["img"]["height"],
        ),
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate(widget.onboarding["title"]),
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 28.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                LanguageTranslationHelper.of(context)!
                    .translate(widget.onboarding["description"]),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 17.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
