import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'toggle_menu_bottom_sheet_widget.dart' show ToggleMenuBottomSheetWidget;
import 'package:flutter/material.dart';

class ToggleMenuBottomSheetModel
    extends FlutterFlowModel<ToggleMenuBottomSheetWidget> {
  ///  Local state fields for this component.

  List<int> ids = [];
  void addToIds(int item) => ids.add(item);
  void removeFromIds(int item) => ids.remove(item);
  void removeAtIndexFromIds(int index) => ids.removeAt(index);
  void insertAtIndexInIds(int index, int item) => ids.insert(index, item);
  void updateIdsAtIndex(int index, Function(int) updateFn) =>
      ids[index] = updateFn(ids[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in SendMessage widget.
  List<ChatroomOverviewRow>? chatroomOverviewOutput;
  // Stores action output result for [Backend Call - Insert Row] action in SendMessage widget.
  ChatroomsRow? newChatroomOutput;
  // Stores action output result for [Backend Call - Query Rows] action in SendMessage widget.
  List<ChatroomOverviewRow>? overviewOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
