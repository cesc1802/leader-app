import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leader_app/routes/app_router.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:leader_app/themes/app_themes.dart';
import 'package:leader_app/utils/utils.dart';

void initApp() {}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Utils.setStyleAppSystemUI();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.appLightTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('vi'),
      ],
      locale: const Locale('vi'),
      initialRoute: RouteNames.root,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
