import '/flutter_flow/flutter_flow_util.dart';
import 'new_to_do_item_widget.dart' show NewToDoItemWidget;
import 'package:flutter/material.dart';

class NewToDoItemModel extends FlutterFlowModel<NewToDoItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NewMatchField widget.
  FocusNode? newMatchFieldFocusNode;
  TextEditingController? newMatchFieldTextController;
  String? Function(BuildContext, String?)? newMatchFieldTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newMatchFieldFocusNode?.dispose();
    newMatchFieldTextController?.dispose();
  }
}
