import '/backend/backend.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'more_widget.dart' show MoreWidget;
import 'package:flutter/material.dart';

class MoreModel extends FlutterFlowModel<MoreWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - scanQRCode] action in Container widget.
  String? qRCodeWeb;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  SlidesAuthRecord? authDocWeb;
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
