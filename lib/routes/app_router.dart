import 'package:flutter/material.dart';
import 'package:leader_app/features/app.dart';
import 'package:leader_app/features/auth/pages/login_page.dart';
import 'package:leader_app/features/auth/pages/welcome_page.dart';
import 'package:leader_app/features/decision/pages/list_decision_page.dart';
import 'package:leader_app/features/decision/pages/list_decision_page_v2.dart';
import 'package:leader_app/features/error/error_page.dart';
import 'package:leader_app/routes/route_name.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.root:
        return buildRoute(settings, App());
      case RouteNames.welcome:
        return buildRoute(settings, WelcomeScreen());
      case RouteNames.authLogin:
        return buildRoute(settings, AuthScreen());
      case RouteNames.decisionList:
        return buildRoute(settings, ListDecisionPage());
      case RouteNames.decisionListV2:
        return buildRoute(settings, ListDecisionPageV2());
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

  // static get routeAndNavigatorSettings => RouteAndNavigatorSettings(
  //       initialRoute: "/",
  //       onGenerateRoute: generateRoute,
  //     );

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
