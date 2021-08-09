import 'package:dio/dio.dart';
import 'package:leader_app/api/api.dart';
import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/models/list_decision_response.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/features/decision/provider/app_error.dart';
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

  Future<ListDecisionResponse> getListHistoryDecision({
    required int page,
    required int pageSize,
  }) async {
    try {
      Response response = await this._apiProvider.get(
        Api.HIST_APPROVED_DECISION,
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

  Future<Decision> getByDecisionNumber(String decisionNum) async {
    try {
      Response response =
          await this._apiProvider.get(Api.GET_QD02 + "/$decisionNum");
      return Decision.fromJSON(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  void handleError(Object? e) {
    if (e is DioError) {
      AppError error = AppError(message: '', errorKey: '', statusCode: 0);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          error = AppError.error(message: 'DioErrorType.connectTimeout');
          break;
        case DioErrorType.sendTimeout:
          error = AppError.error(message: 'DioErrorType.sendTimeout');
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          break;
        case DioErrorType.cancel:
          error = AppError.error(message: 'DioErrorType.cancel');

          break;
        case DioErrorType.other:
          try {
            error = AppError.fromJson(e.response!.data);
          } catch (e) {
            error = AppError.error(message: 'DioErrorType.other');
          }
          break;
      }
      throw error;
    }
  }
}
