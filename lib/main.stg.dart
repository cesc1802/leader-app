import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leader_app/blocs/app_state_bloc.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/flavor_config.dart';
import 'package:leader_app/routes/app_router.dart';
import 'package:leader_app/routes/route_name.dart';
import 'package:leader_app/themes/app_themes.dart';
import 'package:leader_app/utils/utils.dart';

void initApp() {
  FlavorConfig(
    flavor: Flavor.STG,
    values: FlavorValues(
      baseUrl: "http://222.252.17.214:7000/appLanhDao/api/v1",
      appVer: "0.0.1",
    ),
  );
}

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
      child: StreamBuilder<AppState>(
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
              initialRoute: RouteNames.welcome,
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Dismiss Close Demo'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   void _handleCloseAfterTap(BuildContext context) {
//     print("_handleCloseAfterTap");
//     Slidable.of(context)?.close();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = SlidableController();
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context, index) {
//             return Slidable(
//               controller: controller,
//               key: Key("$index"),
//               dismissal: SlidableDismissal(
//                 child: SlidableDrawerDismissal(),
//                 onWillDismiss: (actionType) {
//                   showCupertinoModalPopup(
//                     context: context,
//                     builder: (BuildContext context) => CupertinoActionSheet(
//                       title: const Text('Choose Options'),
//                       message: const Text('Your options are '),
//                       actions: <Widget>[
//                         CupertinoActionSheetAction(
//                           child: const Text('Close the slidable'),
//                           onPressed: () {
//                             Navigator.pop(context, 'One');
//                           },
//                         ),
//                         CupertinoActionSheetAction(
//                           child: const Text('Two'),
//                           onPressed: () {
//                             Navigator.pop(context, 'Two');
//                           },
//                         )
//                       ],
//                     ),
//                   ).then((onValue) {
//                     controller.activeState!.close();
//                   });
//                   return true;
//                 },
//               ),
//               actionPane: SlidableDrawerActionPane(),
//               actionExtentRatio: 0.25,
//               child: Container(
//                 color: Colors.white,
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.indigoAccent,
//                     child: Text('t'),
//                     foregroundColor: Colors.white,
//                   ),
//                   title: Text('Tile n°'),
//                   subtitle: Text('SlidableDrawerDelegate'),
//                 ),
//               ),
//               actions: <Widget>[
//                 IconSlideAction(
//                   caption: 'Archive',
//                   color: Colors.blue,
//                   icon: Icons.archive,
//                   onTap: () => _handleCloseAfterTap(context),
//                 ),
//                 IconSlideAction(
//                   caption: 'Share',
//                   color: Colors.indigo,
//                   icon: Icons.share,
//                 ),
//               ],
//               secondaryActions: <Widget>[
//                 IconSlideAction(
//                   caption: 'More',
//                   color: Colors.black45,
//                   icon: Icons.more_horiz,
//                 ),
//                 IconSlideAction(
//                   caption: 'Delete',
//                   color: Colors.red,
//                   icon: Icons.delete,
//                 ),
//               ],
//             );
//           }),
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//     );
//   }
// }
