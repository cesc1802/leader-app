class DetailDecisionResponse {
  final String decisionId;
  final String decisionNumber;
  final String decisionDate;
  final String violatorName;
  final String violationBehavior;
  final String violatorAddress;
  final String additional;
  final int totalAmount;

  DetailDecisionResponse.fromJson(Map<String, dynamic> json)
      : decisionId = json['id'].toString(),
        decisionNumber = json['soQuyetDinh'],
        decisionDate = json['ngayLapBb'],
        violatorAddress = json['diaChiNvp'],
        violatorName = json['tenNguoiNvp'],
        violationBehavior = json['hanhViVp'],
        additional = json['hinhThucXp'],
        totalAmount = json['tongMucPhat'];
}
