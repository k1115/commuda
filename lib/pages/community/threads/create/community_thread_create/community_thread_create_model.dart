import '/backend/supabase/supabase.dart';
import '/components/removable_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'community_thread_create_widget.dart' show CommunityThreadCreateWidget;
import 'package:flutter/material.dart';

class CommunityThreadCreateModel
    extends FlutterFlowModel<CommunityThreadCreateWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> uploadedImages = [];
  void addToUploadedImages(FFUploadedFile item) => uploadedImages.add(item);
  void removeFromUploadedImages(FFUploadedFile item) =>
      uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, FFUploadedFile item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  List<String> uploadedImageURLs = [];
  void addToUploadedImageURLs(String item) => uploadedImageURLs.add(item);
  void removeFromUploadedImageURLs(String item) =>
      uploadedImageURLs.remove(item);
  void removeAtIndexFromUploadedImageURLs(int index) =>
      uploadedImageURLs.removeAt(index);
  void insertAtIndexInUploadedImageURLs(int index, String item) =>
      uploadedImageURLs.insert(index, item);
  void updateUploadedImageURLsAtIndex(int index, Function(String) updateFn) =>
      uploadedImageURLs[index] = updateFn(uploadedImageURLs[index]);

  bool disableButton = false;

  bool canUpload = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<CommunityWithImageRow>? community2;
  bool isDataUploading_uploadedThreadImage = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadedThreadImage = [];
  List<String> uploadedFileUrls_uploadedThreadImage = [];

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CommunityWithImageRow>? community;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '入力してください。';
    }

    return null;
  }

  // Models for RemovableImage dynamic component.
  late FlutterFlowDynamicModels<RemovableImageModel> removableImageModels;
  bool isDataUploading_createdThreadImage = false;
  FFUploadedFile uploadedLocalFile_createdThreadImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Image widget.
  bool? validateThreadImage;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    removableImageModels =
        FlutterFlowDynamicModels(() => RemovableImageModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    removableImageModels.dispose();
  }
}
