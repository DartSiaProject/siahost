import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/string_const.dart';
import 'package:sia_host_mobile/src/shared/constants/svgs_const.dart' as icon;
import 'package:sia_host_mobile/src/shared/helpers/tab_router_helper.dart';

import '../../../core/configs/language_config/translator.dart';
import '../../../core/router/auto_routes.dart';

@RoutePage()
class SiaMainScreen extends StatefulWidget {
  const SiaMainScreen({super.key});

  @override
  State<SiaMainScreen> createState() => _SiaMainScreenState();
}

class _SiaMainScreenState extends State<SiaMainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        HostRoute(),
        HostConfigRoute(),
      ],
      builder: (context, child) {
        var _tabsRouter = AutoTabsRouter.of(context);
        return WillPopScope(
          onWillPop: () async =>
              TabRouterHelper.siaBackSubScreen(_tabsRouter, context),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
            body: child,
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: color.darkJungleGreenColor,
              selectedIndex: _tabsRouter.activeIndex,
              showElevation: true,
              onItemSelected: (pageIndex) =>
                  _tabsRouter.setActiveIndex(pageIndex),
              items: List.generate(
                bottomNavigatorItems.length,
                (navItemIndex) => BottomNavyBarItem(
                  icon: SvgPicture.asset(
                    bottomNavigatorItems[navItemIndex]["icon"],
                    width: 24.0.w,
                    height: 24.0.h,
                    colorFilter: ColorFilter.mode(
                      _tabsRouter.activeIndex == navItemIndex
                          ? color.spearmintColor
                          : color.mistBlueColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    Translator.of(context)!
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
          ),
        );
      },
    );
  }
}
