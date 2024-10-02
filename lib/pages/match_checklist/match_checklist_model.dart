import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'match_checklist_widget.dart' show MatchChecklistWidget;
import 'package:flutter/material.dart';

class MatchChecklistModel extends FlutterFlowModel<MatchChecklistWidget> {
  ///  Local state fields for this page.

  int checkI = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MatchListItemsRecord>? matchListQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
