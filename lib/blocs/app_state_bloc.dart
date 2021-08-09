import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_provider.dart';

enum AppState { loading, unAuthorized, authorized }

class AppStateBloc implements BlocBase {
  final _appState = BehaviorSubject<AppState>.seeded(AppState.loading);

  Stream<AppState> get appStateStream => _appState.stream;

  AppState? get appState => _appState.stream.value;

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
    _appState.close();
  }

  @override
  // TODO: implement errorMessageSink
  Sink<String> get errorMessageSink => throw UnimplementedError();

  @override
  // TODO: implement errorMessageStream
  Stream<String> get errorMessageStream => throw UnimplementedError();

  @override
  void handleError(String blocName, Object? object, stacktrace) {
    // TODO: implement handleError
  }

  @override
  // TODO: implement isLoadingSink
  Sink<bool> get isLoadingSink => throw UnimplementedError();

  @override
  // TODO: implement isLoadingStream
  Stream<bool> get isLoadingStream => throw UnimplementedError();

  @override
  void showMessage() {
    // TODO: implement showMessage
  }
}
