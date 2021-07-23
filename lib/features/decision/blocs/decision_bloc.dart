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

  DecisionBloc() {
    _decisionRemoveController.listen(_handleRemoveDecision);
  }

  void _handleRemoveDecision(Decision decision) {
    _decisions.remove(decision);
    _notify();
  }

  BehaviorSubject<Decision> _decisionRemoveController =
      BehaviorSubject<Decision>();
  Sink<Decision> get inRemoveDecision => _decisionRemoveController.sink;

  BehaviorSubject<int> _currentPageController = BehaviorSubject<int>.seeded(1);

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
    currentPage++;

    return DecisionState.success;
  }

  Future<DecisionState> approvedDecision(int id) async {
    UpdateDecisionResponse result = await _decisionRepo.approvedDecision(id);
    _updDecisionCtrl.add(result);
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
    _listDecisionController.close();
    _updDecisionCtrl.close();
  }

  BehaviorSubject<List<Decision>> _decisionsController =
      new BehaviorSubject<List<Decision>>();
  Sink<List<Decision>> get _inDecisions => _decisionsController.sink;
  Stream<List<Decision>> get outDecisions =>
      _decisionsController.stream.debounce(
        (_) => TimerStream(
          true,
          Duration(
            seconds: 1,
          ),
        ),
      );
}
