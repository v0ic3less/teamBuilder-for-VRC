import '/flutter_flow/flutter_flow_util.dart';
import 'meeting_cards_copy_widget.dart' show MeetingCardsCopyWidget;
import 'package:flutter/material.dart';

class MeetingCardsCopyModel extends FlutterFlowModel<MeetingCardsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
  }
}
