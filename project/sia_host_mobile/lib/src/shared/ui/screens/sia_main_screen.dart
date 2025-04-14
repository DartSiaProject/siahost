import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/language_config/translator.dart';
import '../../../core/router/auto_routes.dart';
import '../../constants/colors_const.dart';
import '../../constants/string_const.dart';
import '../../constants/svgs_const.dart';
import '../../helpers/tab_router_helper.dart';

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
        FilesRoute(),
      ],
      builder: (context, child) {
        var _tabsRouter = AutoTabsRouter.of(context);
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (value, _) async {
            if (TabRouterHelper.siaBackSubScreen(_tabsRouter, context)) {
              await SystemNavigator.pop();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0.r),
                    color: ColorsApp.tunaColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5.0.r),
                      onTap: () {
                        context.router.push(const NotificationRoute());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          IconSvgs.smsNotifsSvg,
                          width: 24.0.w,
                          height: 24.0.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Center(
              // child: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   child: child,
              // ),
              child: child,
            ),
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: ColorsApp.darkJungleGreenColor,
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
                          ? ColorsApp.spearmintColor
                          : ColorsApp.mistBlueColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    Translator.of(context)!
                        .translate(bottomNavigatorItems[navItemIndex]["label"]),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.0.sp,
                      color: ColorsApp.spearmintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  activeColor: ColorsApp.paleTealColor.withOpacity(0.46),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
