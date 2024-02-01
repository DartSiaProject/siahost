import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;
import 'package:sia_host_mobile/src/shared/constants/routes_const.dart';
import 'package:sia_host_mobile/src/shared/constants/string_const.dart';
import 'package:sia_host_mobile/src/shared/ui/sub_pages/onboarding_dynamic_sub_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/configs/language_config/translator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _onboardingPageViewController;

  @override
  void initState() {
    super.initState();
    _onboardingPageViewController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _onboardingPageViewController,
                itemCount: onboardingList.length,
                itemBuilder: (context, onboardingItem) =>
                    OnboardingDynamicSubPage(
                  onboarding: onboardingList[onboardingItem],
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _onboardingPageViewController,
              count: onboardingList.length,
              effect: WormEffect(
                dotWidth: 16.0.w,
                dotHeight: 16.0.h,
                dotColor: color.neptuneColor,
                spacing: 10.0.w,
                activeDotColor: color.spearmintColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 55.0,
                bottom: 20.0,
              ),
              child: SizedBox(
                width: 208.0.w,
                height: 58.0.h,
                child: Material(
                  color: color.spearmintColor,
                  borderRadius: BorderRadius.circular(12.0.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0.r),
                    onTap: () {
                      context.router.replaceNamed(RoutePath.loginAccountPath);
                    },
                    child: Center(
                      child: Text(
                        Translator.of(context)!.translate(lang.startText),
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 21.0.sp,
                          color: color.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _onboardingPageViewController.dispose();
  }
}
