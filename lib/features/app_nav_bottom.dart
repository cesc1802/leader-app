import 'package:flutter/material.dart';
import 'package:leader_app/features/notification/pages/noticication_page.dart';
import 'package:leader_app/features/profile/pages/profile_page.dart';
import 'package:leader_app/resources/app_constants.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/routes/app_router.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'home/pages/home_page.dart';

class NavBottom extends StatefulWidget {
  static BuildContext? homeTabContext;
  static BuildContext? orderTabContext;
  static BuildContext? savedTabContext;
  static BuildContext? profileTabContext;

  static BuildContext getTabContext(index) {
    switch (index) {
      case 0:
        return homeTabContext!;
      case 1:
        return orderTabContext!;
      case 2:
        return savedTabContext!;
      default:
        return profileTabContext!;
    }
  }

  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> with WidgetsBindingObserver {
  late PersistentTabController bottomNavController;
  late int tabIndex;
  late BuildContext selectedTabContext;
  var screens;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    bottomNavController = PersistentTabController(initialIndex: 0);
    tabIndex = 0;
    screens = [
      HomePage(),
      NotificationPage(),
      ProfilePage(),
    ];
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    bottomNavController.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("AppNav resume");
      Utils.setStyleAppSystemUI();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: bottomNavController,
        screens: screens,
        items: buildNavBottomItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: false,
        popActionScreens: PopActionScreensType.once,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 150),
          curve: Curves.ease,
        ),
        navBarHeight: kBottomNavHeight,
        padding: NavBarPadding.symmetric(vertical: Dimens.gap_dp16),
        decoration: NavBarDecoration(
          border: Border(
            top: BorderSide(width: 1, color: AppColors.primaryColor),
          ),
        ),
        onItemSelected: handleTabSelected,
        onWillPop: (context) async {
          return true;
        },
        selectedTabScreenContext: (context) {
          selectedTabContext = context!;
        },
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 150),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }

  List<PersistentBottomNavBarItem> buildNavBottomItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(
            UIData.homeIcon,
          ),
        ),
        textStyle: TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBottomInactiveColor,
        routeAndNavigatorSettings: AppRouter.routeAndNavigatorSettings,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(UIData.notificationIcon),
        ),
        textStyle: TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBottomInactiveColor,
        routeAndNavigatorSettings: AppRouter.routeAndNavigatorSettings,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(UIData.profileIcon),
        ),
        textStyle: TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBottomInactiveColor,
        routeAndNavigatorSettings: AppRouter.routeAndNavigatorSettings,
      ),
    ];
  }

  // For process
  handleTabSelected(int index) {
    if (tabIndex == index) {
      Navigator.of(NavBottom.getTabContext(index))
          .popUntil((route) => route.isFirst);
    } else {
      tabIndex = index;
    }
  }
}
