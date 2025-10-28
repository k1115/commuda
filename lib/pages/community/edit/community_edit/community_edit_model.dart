import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/necessary_label/necessary_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'community_edit_widget.dart' show CommunityEditWidget;
import 'package:flutter/material.dart';

class CommunityEditModel extends FlutterFlowModel<CommunityEditWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  int inviteMethod = 0;

  List<CategoryInfoStruct> categories = [];
  void addToCategories(CategoryInfoStruct item) => categories.add(item);
  void removeFromCategories(CategoryInfoStruct item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, CategoryInfoStruct item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(
          int index, Function(CategoryInfoStruct) updateFn) =>
      categories[index] = updateFn(categories[index]);

  List<int> selectedTemplate = [];
  void addToSelectedTemplate(int item) => selectedTemplate.add(item);
  void removeFromSelectedTemplate(int item) => selectedTemplate.remove(item);
  void removeAtIndexFromSelectedTemplate(int index) =>
      selectedTemplate.removeAt(index);
  void insertAtIndexInSelectedTemplate(int index, int item) =>
      selectedTemplate.insert(index, item);
  void updateSelectedTemplateAtIndex(int index, Function(int) updateFn) =>
      selectedTemplate[index] = updateFn(selectedTemplate[index]);

  String? imageURL;

  int? selectedTemplatedId;

  List<int> deletedCategories = [];
  void addToDeletedCategories(int item) => deletedCategories.add(item);
  void removeFromDeletedCategories(int item) => deletedCategories.remove(item);
  void removeAtIndexFromDeletedCategories(int index) =>
      deletedCategories.removeAt(index);
  void insertAtIndexInDeletedCategories(int index, int item) =>
      deletedCategories.insert(index, item);
  void updateDeletedCategoriesAtIndex(int index, Function(int) updateFn) =>
      deletedCategories[index] = updateFn(deletedCategories[index]);

  List<String> addedCategories = [];
  void addToAddedCategories(String item) => addedCategories.add(item);
  void removeFromAddedCategories(String item) => addedCategories.remove(item);
  void removeAtIndexFromAddedCategories(int index) =>
      addedCategories.removeAt(index);
  void insertAtIndexInAddedCategories(int index, String item) =>
      addedCategories.insert(index, item);
  void updateAddedCategoriesAtIndex(int index, Function(String) updateFn) =>
      addedCategories[index] = updateFn(addedCategories[index]);

  bool disableButton = false;

  String? inviteCode;

  String? inviteCodeURL;

  List<String> tempStrList = [];
  void addToTempStrList(String item) => tempStrList.add(item);
  void removeFromTempStrList(String item) => tempStrList.remove(item);
  void removeAtIndexFromTempStrList(int index) => tempStrList.removeAt(index);
  void insertAtIndexInTempStrList(int index, String item) =>
      tempStrList.insert(index, item);
  void updateTempStrListAtIndex(int index, Function(String) updateFn) =>
      tempStrList[index] = updateFn(tempStrList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in CommunityEdit widget.
  List<CommunityCoverImagesRow>? communityImages;
  // Stores action output result for [Backend Call - Query Rows] action in CommunityEdit widget.
  List<CommunityCategoriesNameRow>? communityCategories;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel1;
  // State field(s) for ImageRadio widget.
  FormFieldController<String>? imageRadioValueController;
  bool isDataUploading_updatedImageForEdit = false;
  FFUploadedFile uploadedLocalFile_updatedImageForEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateUpdatedImage;
  bool isDataUploading_createdImageForEdit = false;
  FFUploadedFile uploadedLocalFile_createdImageForEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateCreatedImage;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel2;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel3;
  // State field(s) for summery widget.
  FocusNode? summeryFocusNode;
  TextEditingController? summeryTextController;
  String? Function(BuildContext, String?)? summeryTextControllerValidator;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel4;
  // State field(s) for rule widget.
  FocusNode? ruleFocusNode;
  TextEditingController? ruleTextController;
  String? Function(BuildContext, String?)? ruleTextControllerValidator;
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  // State field(s) for RadioButton1 widget.
  FormFieldController<String>? radioButton1ValueController;
  // State field(s) for RadioButton2 widget.
  FormFieldController<String>? radioButton2ValueController;
  // State field(s) for RadioButton3 widget.
  FormFieldController<String>? radioButton3ValueController;
  // State field(s) for RadioButton4 widget.
  FormFieldController<String>? radioButton4ValueController;
  // State field(s) for RadioButton5 widget.
  FormFieldController<String>? radioButton5ValueController;
  bool isDataUploading_uploadedImageForEdit = false;
  FFUploadedFile uploadedLocalFile_uploadedImageForEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadedImageForEdit = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CategoriesRow? categoryOutput;

  @override
  void initState(BuildContext context) {
    necessaryLabelModel1 = createModel(context, () => NecessaryLabelModel());
    necessaryLabelModel2 = createModel(context, () => NecessaryLabelModel());
    necessaryLabelModel3 = createModel(context, () => NecessaryLabelModel());
    necessaryLabelModel4 = createModel(context, () => NecessaryLabelModel());
  }

  @override
  void dispose() {
    necessaryLabelModel1.dispose();
    necessaryLabelModel2.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    necessaryLabelModel3.dispose();
    summeryFocusNode?.dispose();
    summeryTextController?.dispose();

    necessaryLabelModel4.dispose();
    ruleFocusNode?.dispose();
    ruleTextController?.dispose();

    categoryFocusNode?.dispose();
    categoryTextController?.dispose();
  }

  /// Additional helper methods.
  String? get imageRadioValue => imageRadioValueController?.value;
  String? get radioButton1Value => radioButton1ValueController?.value;
  String? get radioButton2Value => radioButton2ValueController?.value;
  String? get radioButton3Value => radioButton3ValueController?.value;
  String? get radioButton4Value => radioButton4ValueController?.value;
  String? get radioButton5Value => radioButton5ValueController?.value;
}
