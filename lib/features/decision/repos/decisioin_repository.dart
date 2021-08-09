import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/models/list_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/features/decision/provider/decision_provider.dart';
import 'package:leader_app/repository/repository.dart';

class DecisionRepository extends Repository {
  DecisionApiProvider _apiProvider = new DecisionApiProvider();

  Future<ListDecisionResponse> listDecision(int page, int pageSz) {
    return _apiProvider
        .getListDecision(page: page, pageSize: pageSz)
        .catchError((Object? error, dynamic stacktrace) {
      print(stacktrace);
      handleError(error);
    });
  }

  Future<ListDecisionResponse> listHistoryDecision(int page, int pageSz) {
    return _apiProvider
        .getListHistoryDecision(page: page, pageSize: pageSz)
        .catchError((Object? error, dynamic stacktrace) {
      handleError(error);
    });
  }

  Future<UpdateDecisionResponse> approvedDecision(int id) {
    return _apiProvider.updateDecisionById(
      id,
      {},
    ).catchError((Object? error, dynamic stacktrace) {
      handleError(error);
    });
  }

  Future<DetailDecisionResponse> getDecisionById(String id) async {
    return _apiProvider
        .getById(id)
        .catchError((Object? error, dynamic stacktrace) {
      handleError(error);
    });
  }

  Future<Decision> getDecisionByDecisionNumber(String decisionNum) {
    return _apiProvider
        .getByDecisionNumber(decisionNum)
        .catchError((Object? error, dynamic stacktrace) {
      handleError(error);
    });
  }
}
