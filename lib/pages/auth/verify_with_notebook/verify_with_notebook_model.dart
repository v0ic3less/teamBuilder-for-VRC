import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verify_with_notebook_widget.dart' show VerifyWithNotebookWidget;
import 'package:flutter/material.dart';

class VerifyWithNotebookModel
    extends FlutterFlowModel<VerifyWithNotebookWidget> {
  ///  Local state fields for this page.

  bool upload1State = false;

  bool upload2State = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamsRecord? teamDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
