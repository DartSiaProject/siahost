import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/controllers/sia_bloc/sia_bloc.dart';
import '../../utils/constants/colors_const.dart' as color;
import '../../utils/constants/string_const.dart';
import '../../utils/helpers/back_press_helpers/back_press_helper.dart';
import '../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../fragments/sia_fragments/charts_fragment.dart';
import '../fragments/sia_fragments/clock_fragment.dart';
import '../fragments/sia_fragments/home_fragment.dart';
import '../fragments/sia_fragments/search_fragment.dart';

class SiaScreen extends StatefulWidget {
  const SiaScreen({super.key});

  @override
  State<SiaScreen> createState() => _SiaScreenState();
}

class _SiaScreenState extends State<SiaScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => BackPressHelper.siaBackFragment(context),
      child: BlocBuilder<SiaBloc, SiaState>(
        builder: (context, siaBuilderState) {
          int _pageIndexSelected = 0;

          if (siaBuilderState is NextFragmentSelected) {
            _pageIndexSelected = siaBuilderState.nextFragment;
            BackPressHelper.backstack.add(_pageIndexSelected);
            if (BackPressHelper.backstack.length > 4) {
              BackPressHelper.backstack.clear();
              BackPressHelper.backstack.add(0);
            }
          }

          if (siaBuilderState is PreviousFragmentSelected) {
            _pageIndexSelected = siaBuilderState.previousFragment;
          }
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: _pageIndexSelected,
                children: const <Widget>[
                  HomeFragment(),
                  SearchFragment(),
                  ChartsFragment(),
                  ClockFragment()
                ],
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: color.darkJungleGreenColor,
              selectedIndex: _pageIndexSelected,
              showElevation: true,
              onItemSelected: (pageIndex) => BlocProvider.of<SiaBloc>(context)
                  .add(NextPageIndexEvent(index: pageIndex)),
              items: List.generate(
                bottomNavigatorItems.length,
                (navItemIndex) => BottomNavyBarItem(
                  icon: SvgPicture.asset(
                    bottomNavigatorItems[navItemIndex]["icon"],
                    width: 24.0.w,
                    height: 24.0.h,
                    colorFilter: ColorFilter.mode(
                      _pageIndexSelected == navItemIndex
                          ? color.spearmintColor
                          : color.mistBlueColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    LanguageTranslationHelper.of(context)!
                        .translate(bottomNavigatorItems[navItemIndex]["label"]),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.0.sp,
                      color: color.spearmintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  activeColor: color.paleTealColor.withOpacity(0.46),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
