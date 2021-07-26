import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/features/decision/repos/decisioin_repository.dart';
import 'package:rxdart/rxdart.dart';

class DecisionDetailBloc extends BlocBase {
  BehaviorSubject<DetailDecisionResponse> _decisionDetailController =
      BehaviorSubject<DetailDecisionResponse>();

  Sink<DetailDecisionResponse> get _decisionDetailSink =>
      _decisionDetailController.sink;

  Stream<DetailDecisionResponse> get decisionDetailStream =>
      _decisionDetailController.stream;

  BehaviorSubject<UpdateDecisionResponse> _decisionUpdateController =
      BehaviorSubject<UpdateDecisionResponse>();

  Sink<UpdateDecisionResponse> get _decisionUpdateSink =>
      _decisionUpdateController.sink;

  Stream<UpdateDecisionResponse> get decisionUpdateStream =>
      _decisionUpdateController.stream;

  final _decisionRepo = DecisionRepository();

  Future<DecisionState> getDecisionById(String id) async {
    DetailDecisionResponse detail = await _decisionRepo.getDecisionById(id);

    _decisionDetailSink.add(detail);
    //TODO: emit to stream
    return DecisionState.success;
  }

  Future<DecisionState> approvedDecisionById(int id) async {
    UpdateDecisionResponse isOk = await _decisionRepo.approvedDecision(id);

    _decisionUpdateSink.add(isOk);
    //TODO: emit to stream
    return DecisionState.success;
  }

  @override
  void dispose() {
    _decisionUpdateController.close();
    _decisionDetailController.close();
  }
}
