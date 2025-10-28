import '/backend/supabase/supabase.dart';
import '/components/removable_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/community/threads/components/community_thread_comment/community_thread_comment_widget.dart';
import '/pages/community/threads/components/community_thread_header/community_thread_header_widget.dart';
import '/index.dart';
import 'community_thread_detail_widget.dart' show CommunityThreadDetailWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommunityThreadDetailModel
    extends FlutterFlowModel<CommunityThreadDetailWidget> {
  ///  Local state fields for this page.

  int? metionId;

  List<FFUploadedFile> image = [];
  void addToImage(FFUploadedFile item) => image.add(item);
  void removeFromImage(FFUploadedFile item) => image.remove(item);
  void removeAtIndexFromImage(int index) => image.removeAt(index);
  void insertAtIndexInImage(int index, FFUploadedFile item) =>
      image.insert(index, item);
  void updateImageAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      image[index] = updateFn(image[index]);

  int? commentId;

  bool disableButton = false;

  bool showThread = true;

  List<String> imageURL = [];
  void addToImageURL(String item) => imageURL.add(item);
  void removeFromImageURL(String item) => imageURL.remove(item);
  void removeAtIndexFromImageURL(int index) => imageURL.removeAt(index);
  void insertAtIndexInImageURL(int index, String item) =>
      imageURL.insert(index, item);
  void updateImageURLAtIndex(int index, Function(String) updateFn) =>
      imageURL[index] = updateFn(imageURL[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CommunityThreadHeader component.
  late CommunityThreadHeaderModel communityThreadHeaderModel;
  Completer<List<CommunityThreadCommentsDetailsRow>>? requestCompleter;
  // Models for CommunityThreadComment dynamic component.
  late FlutterFlowDynamicModels<CommunityThreadCommentModel>
      communityThreadCommentModels;
  // Stores action output result for [Backend Call - Query Rows] action in CommunityThreadComment widget.
  List<UsersRow>? userOutput;
  // Models for RemovableImage dynamic component.
  late FlutterFlowDynamicModels<RemovableImageModel> removableImageModels;
  bool isDataUploading_createdImageForComment = false;
  FFUploadedFile uploadedLocalFile_createdImageForComment =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - validateImageFile] action in Image widget.
  bool? validateCreatedImage;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadedImageForComment = false;
  FFUploadedFile uploadedLocalFile_uploadedImageForComment =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadedImageForComment = '';

  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  CommunityThreadCommentsRow? commentOutput1;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  CommunityThreadCommentsRow? commentOutput2;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<CommunityWithImageRow>? communityOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<CommunityMembersRow>? communityMemberOutput;

  @override
  void initState(BuildContext context) {
    communityThreadHeaderModel =
        createModel(context, () => CommunityThreadHeaderModel());
    communityThreadCommentModels =
        FlutterFlowDynamicModels(() => CommunityThreadCommentModel());
    removableImageModels =
        FlutterFlowDynamicModels(() => RemovableImageModel());
  }

  @override
  void dispose() {
    communityThreadHeaderModel.dispose();
    communityThreadCommentModels.dispose();
    removableImageModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
