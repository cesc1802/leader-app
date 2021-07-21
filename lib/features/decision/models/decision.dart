class Decision {
  final int decisionId;
  final String decisionNumber;
  final String violatorName;
  final String remainTime;
  final String driverLicenseNumber;

  Decision({
    required this.decisionId,
    required this.decisionNumber,
    required this.violatorName,
    required this.remainTime,
    required this.driverLicenseNumber,
  });

  factory Decision.fromJSON(Map<String, dynamic> json) {
    return Decision(
      decisionId: json['id'],
      decisionNumber: json['soQuyetDinh'],
      violatorName: json['tenNguoiNvp'],
      remainTime:
          json['thoiGianConLai'].toString() + " " + json['donViThoiGianConLai'],
      driverLicenseNumber: json['bienKiemSoat'],
    );
  }
}
