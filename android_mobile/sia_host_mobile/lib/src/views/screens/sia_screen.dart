import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_host_mobile/src/logic/controllers/search_bloc/search_bloc.dart';

import '../../logic/controllers/sia_bloc/sia_bloc.dart';
import '../../utils/constants/colors_const.dart' as color;
import '../../utils/constants/string_const.dart';
import '../../utils/constants/svgs_const.dart' as icon;
import '../../utils/helpers/back_press_helpers/back_press_helper.dart';
import '../../utils/helpers/language_helpers/language_translation_helper.dart';
import '../fragments/sia_fragments/home_fragment.dart';
import '../fragments/sia_fragments/host_config_fragment.dart';
import '../fragments/sia_fragments/my_host_fragment.dart';
import '../fragments/sia_fragments/search_fragment.dart';

class SiaScreen extends StatefulWidget {
  const SiaScreen({super.key});

  @override
  State<SiaScreen> createState() => _SiaScreenState();
}

class _SiaScreenState extends State<SiaScreen> {
  late int _pageIndexSelected;

  @override
  void initState() {
    super.initState();
    _pageIndexSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _pageIndexSelected == 1
          ? BackPressHelper.searchBackFragment(context)
          : BackPressHelper.siaBackFragment(context),
      child: BlocBuilder<SiaBloc, SiaState>(
        builder: (context, siaBuilderState) {
          if (siaBuilderState is NextFragmentSelected) {
            _pageIndexSelected = siaBuilderState.nextFragment;
            BackPressHelper.backstack.add(_pageIndexSelected);
            if (BackPressHelper.backstack.length > 4) {
              BackPressHelper.backstack.clear();
              BackPressHelper.backstack.add(0);
            }

            if (BackPressHelper.searchBackstack.length > 1) {
              BackPressHelper.searchBackstack.clear();
              BackPressHelper.searchBackstack.add(0);
              BlocProvider.of<SearchBloc>(context).add(
                const PreviousSubPageIndexEvent(index: 0),
              );
            }
          }

          if (siaBuilderState is PreviousFragmentSelected) {
            _pageIndexSelected = siaBuilderState.previousFragment;
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0.r),
                    color: color.tunaColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5.0.r),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          icon.smsNotifsSvg,
                          width: 24.0.w,
                          height: 24.0.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: _pageIndexSelected,
              children: const <Widget>[
                HomeFragment(),
                SearchFragment(),
                MyHostFragment(),
                HostConfigFragment()
              ],
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
