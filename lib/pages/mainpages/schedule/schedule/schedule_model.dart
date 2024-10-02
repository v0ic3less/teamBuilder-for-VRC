import '/components/events/events_widget.dart';
import '/components/match_info_card/match_info_card_widget.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_widget.dart' show ScheduleWidget;
import 'package:flutter/material.dart';

class ScheduleModel extends FlutterFlowModel<ScheduleWidget> {
  ///  Local state fields for this page.

  bool showProfile = false;

  ///  State fields for stateful widgets in this page.

  // Model for MatchInfoCard component.
  late MatchInfoCardModel matchInfoCardModel;
  // Model for Events component.
  late EventsModel eventsModel;
  // Model for NavBarSchedule.
  late NavBarBGModel navBarScheduleModel;
  // Model for NavBarMessages.
  late NavBarBGModel navBarMessagesModel;
  // Model for NavBarHome.
  late NavBarBGModel navBarHomeModel;
  // Model for NavBarExplore.
  late NavBarBGModel navBarExploreModel;
  // Model for NavBarMore.
  late NavBarBGModel navBarMoreModel;
  // Model for NavBarOther.
  late NavBarBGModel navBarOtherModel;

  @override
  void initState(BuildContext context) {
    matchInfoCardModel = createModel(context, () => MatchInfoCardModel());
    eventsModel = createModel(context, () => EventsModel());
    navBarScheduleModel = createModel(context, () => NavBarBGModel());
    navBarMessagesModel = createModel(context, () => NavBarBGModel());
    navBarHomeModel = createModel(context, () => NavBarBGModel());
    navBarExploreModel = createModel(context, () => NavBarBGModel());
    navBarMoreModel = createModel(context, () => NavBarBGModel());
    navBarOtherModel = createModel(context, () => NavBarBGModel());
  }

  @override
  void dispose() {
    matchInfoCardModel.dispose();
    eventsModel.dispose();
    navBarScheduleModel.dispose();
    navBarMessagesModel.dispose();
    navBarHomeModel.dispose();
    navBarExploreModel.dispose();
    navBarMoreModel.dispose();
    navBarOtherModel.dispose();
  }
}
