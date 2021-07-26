import 'package:dio/dio.dart';
import 'package:leader_app/api/api.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/models/list_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/providers/api_provider.dart';

class DecisionApiProvider {
  final _apiProvider = ApiProvider();

  Future<ListDecisionResponse> getListDecision({
    required int page,
    required int pageSize,
  }) async {
    try {
      Response response = await this._apiProvider.get(
        Api.GET_LIST_QD02,
        queryParameters: {
          "page": page,
          "pageSize": pageSize,
        },
      );
      return ListDecisionResponse.fromJSON(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateDecisionResponse> updateDecisionById(
      int id, Map<String, dynamic> data) async {
    try {
      Response response = await this._apiProvider.put(Api.UPDATE_QD02 + "/$id");
      return UpdateDecisionResponse.fromJSON(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DetailDecisionResponse> getById(String id) async {
    try {
      Response response = await this._apiProvider.get(Api.GET_QD02 + "/$id");
      return DetailDecisionResponse.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
