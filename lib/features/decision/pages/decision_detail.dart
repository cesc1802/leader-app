import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leader_app/blocs/bloc_provider.dart';
import 'package:leader_app/features/decision/blocs/decision_detail_bloc.dart';
import 'package:leader_app/features/decision/helper/decision_state_helper.dart';
import 'package:leader_app/features/decision/models/detail_decision_response.dart';
import 'package:leader_app/features/decision/widgets/detail_decision_body.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/resources/strings.dart';
import 'package:leader_app/themes/app_colors.dart';
import 'package:leader_app/utils/custom_snackbar/custom_snack_bar.dart';
import 'package:leader_app/utils/custom_snackbar/top_snack_bar.dart';
import 'package:leader_app/utils/ui_data.dart';
import 'package:leader_app/utils/utils.dart';
import 'package:leader_app/widgets/body_wrapper.dart';
import 'package:leader_app/widgets/button_text.dart';
import 'package:leader_app/widgets/common/app_loading.dart';

class DecisionDetailPage extends StatefulWidget {
  const DecisionDetailPage({
    Key? key,
    required this.decisionNumber,
  }) : super(key: key);

  final String decisionNumber;

  @override
  _DecisionDetailState createState() => _DecisionDetailState();
}

class _DecisionDetailState extends DecisionStateHelper<DecisionDetailPage>
    with SingleTickerProviderStateMixin {
  final decisionDetailBloc = DecisionDetailBloc();

  @override
  void initState() {
    super.initState();
    print(widget.decisionNumber);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      handleGetDecisionById(widget.decisionNumber);
    });
  }

  @override
  bool isLoading = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  void handleGetDecisionById(String id) async {
    Utils.setLoadingStyleAppSystemUI();
    setState(() {
      isLoading = true;
    });
    try {
      var res = await decisionDetailBloc.getDecisionById(widget.decisionNumber);
      handleDecisionState(res);
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorMessage(
        e.message,
      );
    }
  }

  void handleApprovedDecisionById(int id) async {
    Utils.setLoadingStyleAppSystemUI();
    setState(() {
      isLoading = true;
    });
    try {
      var res = await decisionDetailBloc.approvedDecisionById(id);
      handleDecisionState(res);
      showTopSnackBar(
        context,
        CustomSnackBar.success(message: "Phê duyệt quyết định thành công"),
      );
      Future.delayed(Duration(milliseconds: 4000)).whenComplete(
        () => Navigator.of(context).pop(),
      );
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      showTopSnackBar(
        context,
        CustomSnackBar.error(message: e.message),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: decisionDetailBloc,
      child: AppLoading(
        isLoading: isLoading,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(Strings.decision_detail_header),
          ),
          body: Column(
            children: [
              Expanded(
                child: BodyWrapper(
                  padding: const EdgeInsets.only(
                    top: Dimens.gap_dp32,
                    left: Dimens.gap_dp16,
                    right: Dimens.gap_dp16,
                  ),
                  child: SingleChildScrollView(
                    child: StreamBuilder<DetailDecisionResponse>(
                        stream: decisionDetailBloc.decisionDetailStream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return SizedBox(
                              width: double.infinity,
                            );
                          }

                          final DetailDecisionResponse decision =
                              snapshot.data!;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(UIData.decisionDetailIcon),
                                  Column(
                                    children: [
                                      Text(
                                        "Căn cứ biên bản VPHC số:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                      Text(
                                        decision.reportNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gaps.vGap16,
                              snapshot.hasData
                                  ? DetailDecisionBody(
                                      decision: decision,
                                    )
                                  : SizedBox(),
                              Gaps.vGap28,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Xem chi tiết",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: 12,
                                            color: AppColors.primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("xem chi tiết");
                                        },
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "BB/QĐ Liên Quan",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: 12,
                                            color: AppColors.primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("BB/QĐ Liên Quan");
                                        },
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap28,
                              SizedBox(
                                width: double.infinity,
                                child: ButtonText(
                                  title: "Phê duyệt",
                                  borderColor: Colors.white,
                                  onPressed: () {
                                    handleApprovedDecisionById(
                                      int.parse(decision.decisionId),
                                    );
                                  },
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              Gaps.vGap16,
                              SizedBox(
                                width: double.infinity,
                                child: ButtonText(
                                  title: "Từ chối",
                                  backgroundColor: AppColors.secondaryColor,
                                  onPressed: () => Navigator.of(context).pop(),
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              Gaps.vGap32,
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
