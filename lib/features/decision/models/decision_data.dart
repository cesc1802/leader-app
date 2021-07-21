import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/utils/paging.dart';

class DecisionResponse {
  final List<Decision> decisions;
  final Paging paging;

  DecisionResponse({
    required this.decisions,
    required this.paging,
  });

  DecisionResponse.fromJSON(Map<String, dynamic> json)
      : decisions = (json["data"] as List)
            .map((i) => new Decision.fromJSON(i))
            .toList(),
        paging = Paging.fromJSON(json['paging']);
}
