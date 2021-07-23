import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/utils/paging.dart';

class ListDecisionResponse {
  final List<Decision> decisions;
  final Paging paging;

  ListDecisionResponse({
    required this.decisions,
    required this.paging,
  });

  ListDecisionResponse.fromJSON(Map<String, dynamic> json)
      : decisions = (json["data"] as List)
            .map((i) => new Decision.fromJSON(i))
            .toList(),
        paging = Paging.fromJSON(json['paging']);
}
