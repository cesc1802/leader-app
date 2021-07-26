import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/models/list_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/features/decision/provider/decision_provider.dart';

class DecisionRepository {
  DecisionApiProvider _apiProvider = new DecisionApiProvider();

  Future<ListDecisionResponse> listDecision(int page, int pageSz) {
    return _apiProvider.getListDecision(page: page, pageSize: pageSz);
  }

  Future<UpdateDecisionResponse> approvedDecision(int id) {
    return _apiProvider.updateDecisionById(
      id,
      {},
    );
  }

  Future<DetailDecisionResponse> getDecisionById(String id) async {
    return _apiProvider.getById(id);
  }
}
