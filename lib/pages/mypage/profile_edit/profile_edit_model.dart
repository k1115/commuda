import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:flutter/material.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? coverImage;

  FFUploadedFile? profileImage;

  String? coverImageURL;

  String? profileImageURL;

  List<FFUploadedFile> images = [];
  void addToImages(FFUploadedFile item) => images.add(item);
  void removeFromImages(FFUploadedFile item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, FFUploadedFile item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      images[index] = updateFn(images[index]);

  int? index;

  bool disableButton = false;

  bool showLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in ProfileEdit widget.
  List<ProfileRow>? profileOutput;
  bool isDataUploading_updatedCoverImage = false;
  FFUploadedFile uploadedLocalFile_updatedCoverImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateUpdatedCoverImage;
  bool isDataUploading_createdCoverImage = false;
  FFUploadedFile uploadedLocalFile_createdCoverImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateCreatedImage;
  bool isDataUploading_updatedProfileImage = false;
  FFUploadedFile uploadedLocalFile_updatedProfileImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateUpdatedProfileImage;
  bool isDataUploading_createdProfileImage = false;
  FFUploadedFile uploadedLocalFile_createdProfileImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Button widget.
  bool? validateCreatedProfileImage;
  // State field(s) for nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameTextController;
  String? Function(BuildContext, String?)? nicknameTextControllerValidator;
  String? _nicknameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください。';
    }

    return null;
  }

  // State field(s) for summery widget.
  FocusNode? summeryFocusNode;
  TextEditingController? summeryTextController;
  String? Function(BuildContext, String?)? summeryTextControllerValidator;
  bool isDataUploading_image = false;
  FFUploadedFile uploadedLocalFile_image =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_image = '';

  @override
  void initState(BuildContext context) {
    nicknameTextControllerValidator = _nicknameTextControllerValidator;
  }

  @override
  void dispose() {
    nicknameFocusNode?.dispose();
    nicknameTextController?.dispose();

    summeryFocusNode?.dispose();
    summeryTextController?.dispose();
  }
}
