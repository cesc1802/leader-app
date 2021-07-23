import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/blocs/decision_bloc.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/decision.dart';
import 'package:leader_app/features/decision/models/update_decision_response.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/dialog_mixin.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/widgets/rounded_icon_button.dart';

class DecisionInfoWidget extends StatefulWidget {
  @override
  _DecisionInfoWidgetState createState() => _DecisionInfoWidgetState();

  DecisionInfoWidget({
    this.onPressed,
    required this.decision,
  });

  final Decision decision;
  final Function()? onPressed;
}

class _DecisionInfoWidgetState extends DecisionStateHelper<DecisionInfoWidget>
    with DialogMixin {
  late double margin = 28;

  final controller = SlidableController();

  @override
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleApprovedDecision(DecisionBloc bloc) async {
    final state = await bloc.approvedDecision(widget.decision.decisionId);
    await showMessage("Phê duyệt quyết định thành công");
    handleDecisionState(state);
    bloc.removeDecision(widget.decision);
  }

  @override
  Widget build(BuildContext context) {
    final decisionBloc = BlocProvider.of<DecisionBloc>(context);

    return StreamBuilder<UpdateDecisionResponse>(
        stream: decisionBloc.updDecisionResponseStream,
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Slidable(
              key: Key('DecisionInfoWidget'),
              controller: controller,
              actionExtentRatio: 0.14,
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  iconWidget: RoundedIconButton(
                    icon: Image.asset(UIData.acceptIcon, width: 16, height: 16),
                    color: AppColors.primaryColor,
                  ),
                  onTap: () => _handleApprovedDecision(decisionBloc),
                ),
              ],
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.decisionItemBGColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.decision.decisionNumber,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 12),
                        ),
                        Text(
                          widget.decision.driverLicenseNumber,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 12),
                        )
                      ],
                    ),
                    Gaps.vGap12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Người vi phạm ' + widget.decision.violatorName,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 8,
                                  color: AppColors.decisionItemSubTitleColor),
                        ),
                        Text(
                          widget.decision.remainTime,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 8,
                                  color: AppColors.decisionItemSubTitleColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
