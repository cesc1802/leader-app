import 'package:dio/dio.dart';
import 'package:leader_app/features/decision/models/decision_data.dart';
import 'package:leader_app/providers/api_provider.dart';

class DecisionApiProvider {
  final _apiProvider = ApiProvider();
  final String _endpoint = "/QD02/timKiem";

  Future<DecisionResponse> getListDecision({
    required int page,
    required int pageSize,
  }) async {
    try {
      Response response = await this._apiProvider.get(
        _endpoint,
        queryParameters: {
          "page": page,
          "pageSize": pageSize,
        },
      );
      return DecisionResponse.fromJSON(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
