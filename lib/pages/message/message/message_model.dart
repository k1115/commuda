import '/backend/supabase/supabase.dart';
import '/components/common/app_nav_bar/app_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/message/components/chat_room_item/chat_room_item_widget.dart';
import 'dart:async';
import 'message_widget.dart' show MessageWidget;
import 'package:flutter/material.dart';

class MessageModel extends FlutterFlowModel<MessageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<ChatroomOverviewRow>>? requestCompleter;
  // Models for chatRoomItem dynamic component.
  late FlutterFlowDynamicModels<ChatRoomItemModel> chatRoomItemModels;
  // Model for AppNavBar component.
  late AppNavBarModel appNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    chatRoomItemModels = FlutterFlowDynamicModels(() => ChatRoomItemModel());
    appNavBarModel = createModel(context, () => AppNavBarModel());
  }

  @override
  void dispose() {
    chatRoomItemModels.dispose();
    appNavBarModel.dispose();
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
