import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leader_app/blocs/app_event_bloc.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/features/decision/models/list_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/features/decision/repos/decisioin_repository.dart';
import 'package:rxdart/rxdart.dart';

const String TAG = "Deci";

enum DecisionAction {
  GetList,
  GetById,
  Approved,
}

class DecisionBlocEvent {
  final DecisionAction _action;
  final dynamic _value;

  DecisionBlocEvent(this._action, [this._value]);

  DecisionAction get name => _action;
  dynamic get value => _value;
}

class DecisionBloc extends BlocBase {
  final Set<Decision> _decisions = Set<Decision>();
  var totalRecord = 0;
  var currentPage = 1;

  var isCompleted = false;

  final Set<Decision> _histDecisions = Set<Decision>();
  var totalRecordHist = 0;
  var currentPageHist = 1;

  ScrollController scrollController = ScrollController();

  dispatcher(DecisionBlocEvent action) async {
    if (action._action == DecisionAction.Approved) {
    } else if (action._action == DecisionAction.GetList) {
      await getListDecision(1, 7);
    } else if (action._action == DecisionAction.GetById) {}
  }

  late StreamSubscription<BlocEvent> _approveDecisionSubscription;
  late StreamSubscription<BlocEvent> _listDecisionSubscription;

  DecisionBloc() {
    _decisionRemoveController.listen(_handleRemoveDecision);
    _histDecisionRemoveController.listen(_handleRemoveHistDecision);

    _approveDecisionSubscription = AppEventBloc().listenEvent(
      EventName.approveDecision,
      _approveDecisionHandler,
    );

    _listDecisionSubscription = AppEventBloc().listenEvent(
      EventName.listDecision,
      _listDecisionHandler,
    );

    setLoadMoreListener();
  }

  void setLoadMoreListener() {
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels + 30 >=
                scrollController.position.maxScrollExtent &&
            hasMore()) {
          if (isCompleted) {
            return;
          }
          isCompleted = true;
          loadMoreDecision().whenComplete(() => isCompleted = false);
        }
      });
  }

  bool hasMore() {
    print(currentPage);
    print(totalRecord);
    if (currentPage * 7 == totalRecord) return false;
    return true;
  }

  void _approveDecisionHandler(BlocEvent evt) async {
    print(
        '_approveDecisionHandler success approve decision with id : ${evt.value}');
    await getListDecision(1, 7);
  }

  void _listDecisionHandler(BlocEvent evt) async {
    print(
        '_listDecisionHandler success approve decision with id : ${evt.value}');
    await getListDecision(1, 7);
  }

  void _handleRemoveDecision(Decision decision) {
    _decisions.remove(decision);
    _notify();
  }

  void _handleRemoveHistDecision(Decision decision) {
    _histDecisions.remove(decision);
    // _notify();
  }

  BehaviorSubject<Decision> _decisionRemoveController =
      BehaviorSubject<Decision>();

  Sink<Decision> get inRemoveDecision => _decisionRemoveController.sink;

  BehaviorSubject<Decision> _histDecisionRemoveController =
      BehaviorSubject<Decision>();

  Sink<Decision> get inHistRemoveDecision => _histDecisionRemoveController.sink;

  final _listDecisionController = BehaviorSubject<List<Decision>>();
  final _updDecisionCtrl = BehaviorSubject<UpdateDecisionResponse>();

  Stream<UpdateDecisionResponse> get updDecisionResponseStream =>
      _updDecisionCtrl.stream;

  final _decisionRepo = DecisionRepository();

  Future<DecisionState> getListDecision(int page, int limit) async {
    try {
      isLoadingSink.add(true);
      ListDecisionResponse list = await _decisionRepo.listDecision(page, limit);

      //TODO: add to stream
      _inDecisions.add(list.decisions);

      //TODO: store to local, purpose remove case
      _decisions.addAll(list.decisions.toSet());

      totalRecord = list.paging.total!;

      currentPage = page;
      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      //TODO: how to show error inside a bloc
      // if(e is AppError) {
      //   showMess(e.mess);
      // } else {
      //   showMess('something went wrong')
      // }
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }

  Future<DecisionState> loadMoreDecision() async {
    try {
      ListDecisionResponse list =
          await _decisionRepo.listDecision(++currentPage, 7);
      _inDecisions.add(_decisionsController.stream.value! + list.decisions);

      _decisions.addAll(list.decisions.toSet());

      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }

  Future<DecisionState> getHistoryApprovedDecision(int page, int limit) async {
    try {
      ListDecisionResponse list =
          await _decisionRepo.listHistoryDecision(page, limit);

      //TODO: add to stream
      _inDecisions.add(list.decisions);

      //TODO: store to local, purpose remove case
      _histDecisions.addAll(list.decisions.toSet());

      totalRecordHist = list.decisions.length;
      currentPageHist = page;

      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }

  Future<DecisionState> loadMoreHistDecision() async {
    try {
      isLoadingSink.add(true);
      ListDecisionResponse list =
          await _decisionRepo.listHistoryDecision(currentPage + 1, 7);

      _inDecisions.add(_decisionsController.stream.value! + list.decisions);

      //TODO: store to local, purpose remove case
      _histDecisions.addAll(list.decisions.toSet());

      totalRecordHist += list.decisions.length;

      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }

  Future<DecisionState> approvedDecision(int id) async {
    try {
      UpdateDecisionResponse result = await _decisionRepo.approvedDecision(id);
      _updDecisionCtrl.add(result);
      AppEventBloc().emitEvent(BlocEvent(EventName.approveDecision, id));
      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }

  void _notify() {
    _inDecisions.add(_decisions.toList());
  }

  void removeDecision(Decision decision) {
    inRemoveDecision.add(decision);
  }

  @override
  void dispose() {
    _decisionsController.close();
    _listDecisionController.close();
    _updDecisionCtrl.close();
    _approveDecisionSubscription.cancel();
    _listDecisionSubscription.cancel();
    scrollController.dispose();
  }

  BehaviorSubject<List<Decision>> _decisionsController =
      new BehaviorSubject<List<Decision>>();

  Sink<List<Decision>> get _inDecisions => _decisionsController.sink;

  Stream<List<Decision>> get outDecisions =>
      _decisionsController.stream.debounce(
        (_) => TimerStream(
          true,
          Duration(
            microseconds: 500,
          ),
        ),
      );

  BehaviorSubject<String?> _queryDecisionController =
      new BehaviorSubject<String?>.seeded(null);

  Stream<String?> get queryDecisionStream => _queryDecisionController.stream;

  ValueChanged<String> get onQueryChange {
    if (queryDecisionVal == "") {
      AppEventBloc().emitEvent(
        BlocEvent(
          EventName.listDecision,
          queryDecisionVal,
        ),
      );
    }
    return _queryDecisionController.sink.add;
  }

  String? get queryDecisionVal => _queryDecisionController.value;

  Future<DecisionState> getDecisionByDecisionNum() async {
    try {
      Decision decision =
          await _decisionRepo.getDecisionByDecisionNumber(queryDecisionVal!);

      List<Decision> list = [];

      list.add(decision);

      _inDecisions.add(list);
      return DecisionState.success;
    } catch (e, stacktrace) {
      handleError(TAG, e, stacktrace);
      return DecisionState.fail;
    } finally {
      isLoadingSink.add(false);
    }
  }
}
