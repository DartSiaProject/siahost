import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/routes_const.dart' as route;
import '../../../utils/constants/string_const.dart';
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../../fragments/onboarding_fragments/onboarding_dynamic_fragment.dart';

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
                    OnboardingDynamicFragment(
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
                      GoRouter.of(context)
                          .pushReplacement(route.loginAccountScreen);
                    },
                    child: Center(
                      child: Text(
                        LanguageTranslationHelper.of(context)!
                            .translate("start_text"),
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
