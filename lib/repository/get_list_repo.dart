import 'package:leader_app/providers/api_provider.dart';

abstract class GetListRepo<T> {
  final _apiProvider = ApiProvider();

  String get url;

  Future<List<T>> getData() async {
    try {
      final res = await _apiProvider.get(url);

      if (res.statusCode != 200) {
        return <T>[];
      }

      final List data = res.data['data'];
      if (data == null) {
        return <T>[];
      }

      return data.map((json) => parseJSON(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  T parseJSON(Map<String, dynamic> json);
}
