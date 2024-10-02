import '/flutter_flow/flutter_flow_util.dart';
import 'user_report_widget.dart' show UserReportWidget;
import 'package:flutter/material.dart';

class UserReportModel extends FlutterFlowModel<UserReportWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for HarassmentCheckbox widget.
  bool? harassmentCheckboxValue;
  // State field(s) for InappropriatCheckbox widget.
  bool? inappropriatCheckboxValue;
  // State field(s) for InappropriateDescCheckbox widget.
  bool? inappropriateDescCheckboxValue;
  // State field(s) for ImpersonationCheckbox widget.
  bool? impersonationCheckboxValue;
  // State field(s) for SpamCheckbox widget.
  bool? spamCheckboxValue;
  // State field(s) for OtherCheckbox widget.
  bool? otherCheckboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
