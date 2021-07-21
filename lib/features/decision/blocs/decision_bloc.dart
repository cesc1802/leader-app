import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/decision_data.dart';
import 'package:leader_app/features/decision/repos/decisioin_repository.dart';
import 'package:rxdart/rxdart.dart';

class DecisionBloc extends BlocBase {
  final _decisionCtrl = BehaviorSubject<DecisionResponse>();

  // For Stream
  Stream<DecisionResponse> get decisionResponseStream => _decisionCtrl.stream;

  final _decisionRepo = DecisionRepository();

  Future<DecisionState> getListDecision(int page, int limit) async {
    DecisionResponse list = await _decisionRepo.listDecision(page, limit);
    _decisionCtrl.add(list);
    return DecisionState.success;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _decisionCtrl.close();
  }
}
