import 'dart:async';

import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

enum EventName {
  approveDecision,
  listDecision,
}

class BlocEvent {
  final EventName _eventName;
  final dynamic _value;

  BlocEvent(this._eventName, [this._value]);

  EventName get name => _eventName;
  dynamic get value => _value;
}

class AppEventBloc extends BlocBase {
  static final _instance = AppEventBloc._internal();

  factory AppEventBloc() => _instance;

  AppEventBloc._internal();

  final PublishSubject<BlocEvent> _publishSubject = PublishSubject<BlocEvent>();
  final BehaviorSubject<BlocEvent> _behaviorSubject =
      BehaviorSubject<BlocEvent>();

  Function(BlocEvent) get emitEvent => _publishSubject.sink.add;
  Function(BlocEvent) get emitLastEvent => _behaviorSubject.sink.add;

  StreamSubscription<BlocEvent> listenEvent(
      EventName eventName, Function(BlocEvent) handler) {
    return _publishSubject.stream
        .map((event) {
          print(event);
          return event;
        })
        .where((e) => e._eventName == eventName)
        .listen(handler);
  }

  StreamSubscription<BlocEvent> listenLastEvent(
      EventName eventName, Function(BlocEvent) handler) {
    return _behaviorSubject.stream
        .map((event) {
          print(event);
          return event;
        })
        .where((e) => e._eventName == eventName)
        .listen(handler);
  }

  @override
  void dispose() {
    _publishSubject.close();
    _behaviorSubject.close();
  }
}
