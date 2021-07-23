class UpdateDecisionResponse {
  final bool isSuccess;

  UpdateDecisionResponse({
    required this.isSuccess,
  });

  UpdateDecisionResponse.fromJSON(Map<String, dynamic> json)
      : isSuccess = json['data'] ?? false;
}
