import '/flutter_flow/flutter_flow_util.dart';
import 'dev_login_widget.dart' show DevLoginWidget;
import 'package:flutter/material.dart';

class DevLoginModel extends FlutterFlowModel<DevLoginWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
