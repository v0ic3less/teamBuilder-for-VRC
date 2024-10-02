import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'join_team_code_widget.dart' show JoinTeamCodeWidget;
import 'package:flutter/material.dart';

class JoinTeamCodeModel extends FlutterFlowModel<JoinTeamCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in PinCode widget.
  VerifyCodesRecord? code;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? team;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
