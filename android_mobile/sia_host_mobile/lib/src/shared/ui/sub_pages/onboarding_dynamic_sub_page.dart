import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;

import '../../../core/configs/language_config/translator.dart';

class OnboardingDynamicSubPage extends StatefulWidget {
  final Map<String, dynamic> onboarding;
  const OnboardingDynamicSubPage({
    super.key,
    required this.onboarding,
  });

  @override
  State<OnboardingDynamicSubPage> createState() =>
      _OnboardingDynamicSubPageState();
}

class _OnboardingDynamicSubPageState extends State<OnboardingDynamicSubPage> {
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
              Translator.of(context)!.translate(widget.onboarding["title"]),
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
                Translator.of(context)!
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
