import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'team_profile_widget.dart' show TeamProfileWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TeamProfileModel extends FlutterFlowModel<TeamProfileWidget> {
  ///  Local state fields for this page.

  List<String> tagsPage = [];
  void addToTagsPage(String item) => tagsPage.add(item);
  void removeFromTagsPage(String item) => tagsPage.remove(item);
  void removeAtIndexFromTagsPage(int index) => tagsPage.removeAt(index);
  void insertAtIndexInTagsPage(int index, String item) =>
      tagsPage.insert(index, item);
  void updateTagsPageAtIndex(int index, Function(String) updateFn) =>
      tagsPage[index] = updateFn(tagsPage[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TagField widget.
  FocusNode? tagFieldFocusNode;
  TextEditingController? tagFieldTextController;
  String? Function(BuildContext, String?)? tagFieldTextControllerValidator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tagFieldFocusNode?.dispose();
    tagFieldTextController?.dispose();
  }
}
