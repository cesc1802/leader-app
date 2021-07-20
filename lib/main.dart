import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leader_app/blocs/app_state_bloc.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
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
  final _appStateBloc = AppStateBloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print("MainApp resumed");
      Utils.setStyleAppSystemUI();
    }
  }

  @override
  Widget build(BuildContext context) {
    Utils.setStyleAppSystemUI();

    return BlocProvider(
      bloc: _appStateBloc,
      child: StreamBuilder<Object>(
        stream: _appStateBloc.appStateStream,
        initialData: _appStateBloc.initState,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data == AppState.loading) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppThemes.appLightTheme,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppThemes.appLightTheme,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('vi'),
            ],
            locale: const Locale('vi'),
            initialRoute: RouteNames.navBottom,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
