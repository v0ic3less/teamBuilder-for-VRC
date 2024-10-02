import '/backend/backend.dart';
import '/components/explore_cards/explore_cards_widget.dart';
import '/components/local_events/local_events_widget.dart';
import '/components/nav_bar_b_g_widget.dart';
import '/components/signature_events/signature_events_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  Local state fields for this page.

  bool showProfile = false;

  String? teamNumberfromTeamSearch;

  bool blurBackground = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for teamSearchTextField widget.
  FocusNode? teamSearchTextFieldFocusNode;
  TextEditingController? teamSearchTextFieldTextController;
  String? Function(BuildContext, String?)?
      teamSearchTextFieldTextControllerValidator;
  // Algolia Search Results from action on IconButton
  List<TeamsRecord>? algoliaSearchResults = [];
  // Model for LocalEvents component.
  late LocalEventsModel localEventsModel;
  // Model for SignatureEvents.
  late SignatureEventsModel signatureEventsModel;
  // Model for ExploreCards component.
  late ExploreCardsModel exploreCardsModel;
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
    localEventsModel = createModel(context, () => LocalEventsModel());
    signatureEventsModel = createModel(context, () => SignatureEventsModel());
    exploreCardsModel = createModel(context, () => ExploreCardsModel());
    navBarScheduleModel = createModel(context, () => NavBarBGModel());
    navBarMessagesModel = createModel(context, () => NavBarBGModel());
    navBarHomeModel = createModel(context, () => NavBarBGModel());
    navBarExploreModel = createModel(context, () => NavBarBGModel());
    navBarMoreModel = createModel(context, () => NavBarBGModel());
    navBarOtherModel = createModel(context, () => NavBarBGModel());
  }

  @override
  void dispose() {
    teamSearchTextFieldFocusNode?.dispose();
    teamSearchTextFieldTextController?.dispose();

    localEventsModel.dispose();
    signatureEventsModel.dispose();
    exploreCardsModel.dispose();
    navBarScheduleModel.dispose();
    navBarMessagesModel.dispose();
    navBarHomeModel.dispose();
    navBarExploreModel.dispose();
    navBarMoreModel.dispose();
    navBarOtherModel.dispose();
  }
}
