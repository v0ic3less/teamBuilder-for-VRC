import '/components/nav_bar_b_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

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
    navBarScheduleModel = createModel(context, () => NavBarBGModel());
    navBarMessagesModel = createModel(context, () => NavBarBGModel());
    navBarHomeModel = createModel(context, () => NavBarBGModel());
    navBarExploreModel = createModel(context, () => NavBarBGModel());
    navBarMoreModel = createModel(context, () => NavBarBGModel());
    navBarOtherModel = createModel(context, () => NavBarBGModel());
  }

  @override
  void dispose() {
    navBarScheduleModel.dispose();
    navBarMessagesModel.dispose();
    navBarHomeModel.dispose();
    navBarExploreModel.dispose();
    navBarMoreModel.dispose();
    navBarOtherModel.dispose();
  }
}
