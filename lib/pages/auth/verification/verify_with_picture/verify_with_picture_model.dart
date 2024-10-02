import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verify_with_picture_widget.dart' show VerifyWithPictureWidget;
import 'package:flutter/material.dart';

class VerifyWithPictureModel extends FlutterFlowModel<VerifyWithPictureWidget> {
  ///  Local state fields for this page.

  bool upload1State = false;

  bool upload2State = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
