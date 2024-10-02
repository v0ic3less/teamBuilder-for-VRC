import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_user_widget.dart' show InviteUserWidget;
import 'package:flutter/material.dart';

class InviteUserModel extends FlutterFlowModel<InviteUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for chatTeamNumber widget.
  FocusNode? chatTeamNumberFocusNode;
  TextEditingController? chatTeamNumberTextController;
  String? Function(BuildContext, String?)?
      chatTeamNumberTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetTeamID)] action in Button widget.
  ApiCallResponse? otherTeamID;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamExists;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TeamsRecord? usersTeam;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatThread;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chatTeamNumberFocusNode?.dispose();
    chatTeamNumberTextController?.dispose();
  }
}
