import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/app/data/models/onboarding_slide.dart';
import 'package:sia_host_mobile/src/modules/app/logic/cubit/onboarding_cubit.dart';
import 'package:sia_host_mobile/src/modules/app/views/widgets/onboarding_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingView();
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();

  final _onboardingList = const [
    OnboardingSlide(value: 1, imagePath: 'assets/images/host_control.png'),
    OnboardingSlide(value: 2, imagePath: 'assets/images/visualize_data.png'),
    OnboardingSlide(value: 3, imagePath: 'assets/images/network.png'),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSuccess) {
          context.router.replace(const LoginRoute());
        }
      },
      listenWhen: (previous, current) => current is OnboardingSuccess,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _onboardingList.length,
                    itemBuilder: (context, index) => OnboardingWidget(
                      slide: _onboardingList[index],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: _onboardingList.length,
                  effect: WormEffect(
                    dotWidth: 16.0.w,
                    dotHeight: 16.0.h,
                    dotColor: AppTheme.boxBgColor,
                    spacing: 10.0.w,
                    activeDotColor: AppTheme.primaryColor,
                  ),
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                SizedBox(
                  height: 32.0.h,
                ),
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return AppButton(
                      onPressed: () {
                        context.read<OnboardingCubit>().getStarted();
                      },
                      label: context.l10n.getStartedButton,
                      isLoading: state is OnboardingLoading,
                    );
                  },
                ),
                SizedBox(
                  height: 32.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
