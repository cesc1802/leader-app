import 'dart:developer' as Log;

import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/provider/app_error.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocBase {
  void dispose();

  //TODO: handle loading
  BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoadingStream => _isLoadingSubject.stream;
  Sink<bool> get isLoadingSink => _isLoadingSubject.sink;

  //TODO: handle error
  BehaviorSubject<String> _errorMessageSubject =
      BehaviorSubject<String>.seeded('');
  Stream<String> get errorMessageStream => _errorMessageSubject.stream;
  Sink<String> get errorMessageSink => _errorMessageSubject.sink;

  void showMessage() {}

  void handleError(String blocName, Object? object, dynamic stacktrace) {
    Log.log('$blocName ==== $stacktrace');
    if (object is AppError) {
      errorMessageSink.add(object.message ?? '');
    } else {
      errorMessageSink.add('Something went wrong');
    }
  }
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final _BlocProviderInherited? provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited;
    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
