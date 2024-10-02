import '/components/match_info_card/match_info_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'event_details_widget.dart' show EventDetailsWidget;
import 'package:flutter/material.dart';

class EventDetailsModel extends FlutterFlowModel<EventDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MatchInfoCard component.
  late MatchInfoCardModel matchInfoCardModel;

  @override
  void initState(BuildContext context) {
    matchInfoCardModel = createModel(context, () => MatchInfoCardModel());
  }

  @override
  void dispose() {
    matchInfoCardModel.dispose();
  }
}
