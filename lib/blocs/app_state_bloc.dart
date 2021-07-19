import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_provider.dart';

enum AppState { loading, unAuthorized, authorized }

class AppStateBloc implements BlocBase {
  final _appState = BehaviorSubject<AppState>.seeded(AppState.loading);

  AppState? get appStateValue => _appState.stream.value;

  AppState get initState => AppState.loading;

  AppStateBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    final prefs = await SharedPreferences.getInstance();

    final authorLevel = prefs.getInt('author_level') ?? 0;

    switch (authorLevel) {
      case 2:
        await notifyUserLoggedSuccessfully();
        break;
      default:
        await changeAppState(AppState.unAuthorized);
    }
  }

  Future<void> notifyUserLoggedSuccessfully({bool authorized = true}) async {
    if (authorized) {
      await changeAppState(AppState.authorized);
    }
  }

  Future<void> changeAppState(AppState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('author_level', state.index);
    _appState.add(state);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await changeAppState(AppState.unAuthorized);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
