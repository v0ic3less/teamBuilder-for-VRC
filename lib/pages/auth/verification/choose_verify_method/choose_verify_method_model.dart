import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'choose_verify_method_widget.dart' show ChooseVerifyMethodWidget;
import 'package:flutter/material.dart';

class ChooseVerifyMethodModel
    extends FlutterFlowModel<ChooseVerifyMethodWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
