enum DecisionState { expired }

class DecisionItem {
  const DecisionItem({
    required this.decisionNumber,
    required this.violatorName,
    required this.decisionDate,
    required this.state,
  });

  final String decisionNumber;
  final String violatorName;
  final DecisionState state;
  final String decisionDate;
}
