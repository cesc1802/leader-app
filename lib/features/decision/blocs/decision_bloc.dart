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

class DecisionBloc extends BlocBase {
  final Set<Decision> _decisions = Set<Decision>();
  var totalRecord = 0;
  var currentPage = 1;

  final Set<Decision> _histDecisions = Set<Decision>();
  var totalRecordHist = 0;
  var currentPageHist = 1;

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
    ListDecisionResponse list = await _decisionRepo.listDecision(page, limit);

    //TODO: add to stream
    _inDecisions.add(list.decisions);

    //TODO: store to local, purpose remove case
    _decisions.addAll(list.decisions.toSet());

    totalRecord = list.decisions.length;
    currentPage = page;

    return DecisionState.success;
  }

  Future<DecisionState> loadMoreDecision() async {
    ListDecisionResponse list =
        await _decisionRepo.listDecision(currentPage + 1, 5);

    _inDecisions.add(_decisionsController.stream.value! + list.decisions);

    //TODO: store to local, purpose remove case
    _decisions.addAll(list.decisions.toSet());

    totalRecord += list.decisions.length;

    return DecisionState.success;
  }

  Future<DecisionState> getHistoryApprovedDecision(int page, int limit) async {
    ListDecisionResponse list =
        await _decisionRepo.listHistoryDecision(page, limit);

    //TODO: add to stream
    _inDecisions.add(list.decisions);

    //TODO: store to local, purpose remove case
    _histDecisions.addAll(list.decisions.toSet());

    totalRecordHist = list.decisions.length;
    currentPageHist = page;

    return DecisionState.success;
  }

  Future<DecisionState> loadMoreHistDecision() async {
    ListDecisionResponse list =
        await _decisionRepo.listHistoryDecision(currentPage + 1, 5);

    _inDecisions.add(_decisionsController.stream.value! + list.decisions);

    //TODO: store to local, purpose remove case
    _histDecisions.addAll(list.decisions.toSet());

    totalRecordHist += list.decisions.length;

    return DecisionState.success;
  }

  Future<DecisionState> approvedDecision(int id) async {
    UpdateDecisionResponse result = await _decisionRepo.approvedDecision(id);
    _updDecisionCtrl.add(result);
    // --> raise event approve decision

    print("approvedDecision first time init");
    AppEventBloc().emitEvent(BlocEvent(EventName.approveDecision, id));
    return DecisionState.success;
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
      print("emit list event");
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
    Decision decision =
        await _decisionRepo.getDecisionByDecisionNumber(queryDecisionVal!);

    List<Decision> list = [];

    list.add(decision);

    _inDecisions.add(list);
    return DecisionState.success;
  }
}
