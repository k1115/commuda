import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/message/components/message_item/message_item_widget.dart';
import '/index.dart';
import 'dart:async';
import 'message_detail_widget.dart' show MessageDetailWidget;
import 'package:flutter/material.dart';

class MessageDetailModel extends FlutterFlowModel<MessageDetailWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<MessagesRow>>? requestCompleter;
  // Models for messageItem dynamic component.
  late FlutterFlowDynamicModels<MessageItemModel> messageItemModels;
  bool isDataUploading_messageImage = false;
  FFUploadedFile uploadedLocalFile_messageImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_messageImage = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    messageItemModels = FlutterFlowDynamicModels(() => MessageItemModel());
  }

  @override
  void dispose() {
    messageItemModels.dispose();
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
