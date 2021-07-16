class DecisionListView extends StatelessWidget {
  const DecisionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.gap_dp24,
        left: Dimens.gap_dp16,
        right: Dimens.gap_dp16,
      ),
      child: Column(
        children: [
          DecisionCardItem(),
          Gaps.vGap8,
          DecisionCardItem(),
          Gaps.vGap8,
          DecisionCardItem(),
        ],
      ),
    );
  }
}
