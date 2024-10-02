import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'capture_widget.dart' show CaptureWidget;
import 'package:flutter/material.dart';

class CaptureModel extends FlutterFlowModel<CaptureWidget> {
  ///  Local state fields for this page.

  bool showProfile = false;

  int updateVal = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamDoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
