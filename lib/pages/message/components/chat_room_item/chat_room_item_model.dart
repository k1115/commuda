import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_room_item_widget.dart' show ChatRoomItemWidget;
import 'package:flutter/material.dart';

class ChatRoomItemModel extends FlutterFlowModel<ChatRoomItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<BlockUsersRow>? blockUserOutput;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserWithProfileRow>? userOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
