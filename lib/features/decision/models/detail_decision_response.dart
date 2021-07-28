class DetailDecisionResponse {
  final String decisionId;
  final String decisionNumber;
  final String reportNumber;
  final String decisionDate;
  final String decisionUnitImplement;
  final String violatorDob;
  final String violatorName;
  final String violationBehavior;
  final String violatorAddress;
  final String additional;
  final String additionalForm;
  final int totalAmount;

  DetailDecisionResponse.fromJson(Map<String, dynamic> json)
      : decisionId = json['id'].toString(),
        decisionNumber = json['soQuyetDinh'],
        reportNumber = json['soBienBanTc'],
        decisionDate = json['ngayLapBb'],
        decisionUnitImplement = json['dvThiHanhQd'],
        violatorDob = json['ngaySinhNvp'] != null ? json['ngaySinhNvp'] : '',
        violatorAddress = json['diaChiNvp'],
        violatorName = json['tenNguoiNvp'],
        violationBehavior = json['hanhViVp'],
        additional = json['hinhThucXp'],
        additionalForm =
            json['xuPhatBoSung'] != null ? json['xuPhatBoSung'] : '',
        totalAmount = json['tongMucPhat'];
}
