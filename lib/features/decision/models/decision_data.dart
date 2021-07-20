class DecisionData {
  final String decisionNumber;
  final String violatorName;
  final String remainTime;
  final String driverLicenseNumber;

  DecisionData({
    required this.decisionNumber,
    required this.violatorName,
    required this.remainTime,
    required this.driverLicenseNumber,
  });

  factory DecisionData.fromJSON(Map<String, dynamic> json) {
    return DecisionData(
      decisionNumber: json['decisionNumber'],
      violatorName: json['violatorName'],
      remainTime: json['remainTime'],
      driverLicenseNumber: json['driverLicenseNumber'],
    );
  }
}
