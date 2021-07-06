import 'package:flutter/material.dart';
import 'package:leader_app/features/error/error_page.dart';
import 'package:leader_app/features/welcome/pages/welcome.dart';
import 'package:leader_app/routes/route_name.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.root:
      case RouteNames.welcome:
        return buildRoute(settings, WelcomeScreen());
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
