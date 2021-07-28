class Decision {
  final int decisionId;
  final String decisionNumber;
  final String violatorName;
  final String remainTime;
  final String approvedDate;
  final int status;
  final String driverLicenseNumber;

  Decision({
    required this.decisionId,
    required this.decisionNumber,
    required this.approvedDate,
    required this.violatorName,
    required this.remainTime,
    required this.status,
    required this.driverLicenseNumber,
  });

  factory Decision.fromJSON(Map<String, dynamic> json) {
    return Decision(
      decisionId: json['id'],
      decisionNumber: json['soQuyetDinh'],
      violatorName: json['tenNguoiNvp'],
      approvedDate: json['ngayPheDuyet'] != null ? json['ngayPheDuyet'] : '',
      status: json['trangThai'],
      remainTime:
          json['thoiGianConLai'].toString() + " " + json['donViThoiGianConLai'],
      driverLicenseNumber: json['bienKiemSoat'],
    );
  }
}
