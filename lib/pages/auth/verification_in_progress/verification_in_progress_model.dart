import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verification_in_progress_widget.dart' show VerificationInProgressWidget;
import 'package:flutter/material.dart';

class VerificationInProgressModel
    extends FlutterFlowModel<VerificationInProgressWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in VerificationInProgress widget.
  VerificationMessagesRecord? verifMsg;
  List<VerificationMessagesRecord>? containerPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  VerificationMessagesRecord? verifMsgCopy;
  List<TeamsRecord>? formContainerPreviousSnapshot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
