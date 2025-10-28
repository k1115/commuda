import '/backend/supabase/supabase.dart';
import '/components/necessary_label/necessary_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'community_create_widget.dart' show CommunityCreateWidget;
import 'package:flutter/material.dart';

class CommunityCreateModel extends FlutterFlowModel<CommunityCreateWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  int inviteMethod = 0;

  String? inviteCode;

  List<int> selectedTemplate = [];
  void addToSelectedTemplate(int item) => selectedTemplate.add(item);
  void removeFromSelectedTemplate(int item) => selectedTemplate.remove(item);
  void removeAtIndexFromSelectedTemplate(int index) =>
      selectedTemplate.removeAt(index);
  void insertAtIndexInSelectedTemplate(int index, int item) =>
      selectedTemplate.insert(index, item);
  void updateSelectedTemplateAtIndex(int index, Function(int) updateFn) =>
      selectedTemplate[index] = updateFn(selectedTemplate[index]);

  List<int> inviteMethods = [];
  void addToInviteMethods(int item) => inviteMethods.add(item);
  void removeFromInviteMethods(int item) => inviteMethods.remove(item);
  void removeAtIndexFromInviteMethods(int index) =>
      inviteMethods.removeAt(index);
  void insertAtIndexInInviteMethods(int index, int item) =>
      inviteMethods.insert(index, item);
  void updateInviteMethodsAtIndex(int index, Function(int) updateFn) =>
      inviteMethods[index] = updateFn(inviteMethods[index]);

  List<String> categories = [];
  void addToCategories(String item) => categories.add(item);
  void removeFromCategories(String item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, String item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(int index, Function(String) updateFn) =>
      categories[index] = updateFn(categories[index]);

  int? selectedTemplateId;

  bool disableButton = false;

  List<String> tempStrList = [];
  void addToTempStrList(String item) => tempStrList.add(item);
  void removeFromTempStrList(String item) => tempStrList.remove(item);
  void removeAtIndexFromTempStrList(int index) => tempStrList.removeAt(index);
  void insertAtIndexInTempStrList(int index, String item) =>
      tempStrList.insert(index, item);
  void updateTempStrListAtIndex(int index, Function(String) updateFn) =>
      tempStrList[index] = updateFn(tempStrList[index]);

  String? inviteURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel1;
  // State field(s) for ImageRadio widget.
  FormFieldController<String>? imageRadioValueController;
  bool isDataUploading_updatedImage = false;
  FFUploadedFile uploadedLocalFile_updatedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateUpdatedImage;
  bool isDataUploading_createdImage = false;
  FFUploadedFile uploadedLocalFile_createdImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateCreatedImage;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel2;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'コミュニティ名を入力してください。';
    }

    return null;
  }

  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel3;
  // State field(s) for summery widget.
  FocusNode? summeryFocusNode;
  TextEditingController? summeryTextController;
  String? Function(BuildContext, String?)? summeryTextControllerValidator;
  String? _summeryTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'コミュニティ概要を入力してください。';
    }

    return null;
  }

  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel4;
  // State field(s) for rule widget.
  FocusNode? ruleFocusNode;
  TextEditingController? ruleTextController;
  String? Function(BuildContext, String?)? ruleTextControllerValidator;
  String? _ruleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'コミュニティルールを入力してください。';
    }

    return null;
  }

  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;
  // Model for NecessaryLabel component.
  late NecessaryLabelModel necessaryLabelModel5;
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
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? currentUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CommunitiesRow? communityOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CategoriesRow? createdCategory;
  bool isDataUploading_uploadedImage = false;
  FFUploadedFile uploadedLocalFile_uploadedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadedImage = '';

  @override
  void initState(BuildContext context) {
    necessaryLabelModel1 = createModel(context, () => NecessaryLabelModel());
    necessaryLabelModel2 = createModel(context, () => NecessaryLabelModel());
    nameTextControllerValidator = _nameTextControllerValidator;
    necessaryLabelModel3 = createModel(context, () => NecessaryLabelModel());
    summeryTextControllerValidator = _summeryTextControllerValidator;
    necessaryLabelModel4 = createModel(context, () => NecessaryLabelModel());
    ruleTextControllerValidator = _ruleTextControllerValidator;
    necessaryLabelModel5 = createModel(context, () => NecessaryLabelModel());
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

    necessaryLabelModel5.dispose();
  }

  /// Additional helper methods.
  String? get imageRadioValue => imageRadioValueController?.value;
  String? get radioButton1Value => radioButton1ValueController?.value;
  String? get radioButton2Value => radioButton2ValueController?.value;
  String? get radioButton3Value => radioButton3ValueController?.value;
  String? get radioButton4Value => radioButton4ValueController?.value;
  String? get radioButton5Value => radioButton5ValueController?.value;
}
