import 'package:leader_app/features/decision/models/decision_data.dart';

class Decision {
  final DecisionData data;

  Decision({
    required this.data,
  });
  factory Decision.fromJSON(Map<String, dynamic> json) {
    int code = json['code'];
    var data;
    if (code == 200) {
      data = DecisionData.fromJSON(json['data']);
    }
    return Decision(data: data);
  }
}
