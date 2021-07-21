import 'package:flutter/material.dart';
import 'package:leader_app/features/app.dart';
import 'package:leader_app/features/app_nav_bottom.dart';
import 'package:leader_app/features/auth/pages/login_page.dart';
import 'package:leader_app/features/auth/pages/welcome_page.dart';
import 'package:leader_app/features/decision/pages/decision_detail.dart';
import 'package:leader_app/features/decision/pages/list_decision_page.dart';
import 'package:leader_app/features/decision/pages/list_decision_page_v2.dart';
import 'package:leader_app/features/error/error_page.dart';
import 'package:leader_app/features/home/pages/home_page.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.root:
        return buildRoute(settings, App());
      case RouteNames.welcome:
        return buildRoute(settings, WelcomeScreen());
      case RouteNames.authLogin:
        return buildRoute(settings, AuthScreen());
      case RouteNames.home:
        return buildRoute(settings, HomePage());
      case RouteNames.decisionList:
        return buildRoute(settings, ListDecisionPage());
      case RouteNames.decisionListV2:
        return buildRoute(settings, ListDecisionPageV2());
      case RouteNames.decisionDetail:
        return buildRoute(settings, DecisionDetail());
      case RouteNames.navBottom:
        return buildRoute(settings, NavBottom());
      default:
        return buildRoute(settings, ErrorPage(routeName: settings.name));
    }
  }

  static MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static PageRouteBuilder buildRouteWithoutAnimation(
      RouteSettings settings, Widget builder) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => builder,
      settings: settings,
      transitionDuration: Duration(milliseconds: 0),
    );
  }

  static get routeAndNavigatorSettings => RouteAndNavigatorSettings(
        initialRoute: "/",
        onGenerateRoute: generateRoute,
      );

  static Route<dynamic> authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.welcome:
        return buildRoute(settings, WelcomeScreen());
      case RouteNames.authLogin:
        return buildRoute(settings, AuthScreen());
      case RouteNames.home:
        return buildRoute(settings, HomePage());
      case RouteNames.decisionList:
        return buildRoute(settings, ListDecisionPage());
      case RouteNames.decisionListV2:
        return buildRoute(settings, ListDecisionPageV2());
      case RouteNames.decisionDetail:
        return buildRoute(settings, DecisionDetail());
      case RouteNames.navBottom:
        return buildRoute(settings, NavBottom());
      default:
        return buildRoute(settings, ErrorPage(routeName: settings.name));
    }
  }

  // static Route<dynamic> unAuthorizedRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/':
  //       return buildRoute(settings, SignInPage());
  //     case RouteNames.signUp:
  //       return buildRoute(settings, SignUpPage());
  //     default:
  //       return buildRoute(settings, ErrorPage(routeName: settings.name));
  //   }
  // }
}
