import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'account_creation2_widget.dart' show AccountCreation2Widget;
import 'package:flutter/material.dart';

class AccountCreation2Model extends FlutterFlowModel<AccountCreation2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for DisplayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for teamNumber widget.
  FocusNode? teamNumberFocusNode;
  TextEditingController? teamNumberTextController;
  String? Function(BuildContext, String?)? teamNumberTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetTeamID)] action in Button widget.
  ApiCallResponse? json;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamQuery;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TeamsRecord? createdTeamDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    teamNumberFocusNode?.dispose();
    teamNumberTextController?.dispose();
  }
}
