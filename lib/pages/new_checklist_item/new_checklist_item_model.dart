import '/flutter_flow/flutter_flow_util.dart';
import 'new_checklist_item_widget.dart' show NewChecklistItemWidget;
import 'package:flutter/material.dart';

class NewChecklistItemModel extends FlutterFlowModel<NewChecklistItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NewMatchField widget.
  FocusNode? newMatchFieldFocusNode;
  TextEditingController? newMatchFieldTextController;
  String? Function(BuildContext, String?)? newMatchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newMatchFieldFocusNode?.dispose();
    newMatchFieldTextController?.dispose();
  }
}
