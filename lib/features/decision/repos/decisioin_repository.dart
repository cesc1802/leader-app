import 'package:leader_app/features/decision/models/decision_data.dart';
import 'package:leader_app/features/decision/provider/decision_provider.dart';

class DecisionRepository {
  DecisionApiProvider _apiProvider = new DecisionApiProvider();

  Future<DecisionResponse> listDecision(int page, int pageSz) {
    return _apiProvider.getListDecision(page: page, pageSize: pageSz);
  }
}
